import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/widget/EmptyContent.dart';

import '../theme.dart';
import '../tornado.dart';
import 'FilterField.dart';
import 'Pagination.dart';

abstract class PaginationState<E, T extends StatefulWidget> extends State<T> {
  /**
   * 默认分隔线
   */
  final Widget dividerFull = Divider(height: 1, color: Color.fromRGBO(18, 18, 18, 0.08));

  static final labelStyle = TextStyle(overflow: TextOverflow.ellipsis, color: Color(0xff20262E), fontSize: 14);
  static final hintStyle = TextStyle(fontSize: 14, color: Color(0xff959595));

  /**
   * 滚动控制器
   */
  final ScrollController scrollController = new ScrollController();

  GlobalKey queryFormKey = new GlobalKey<FormState>();

  /**
   * 是否在加载
   */
  bool loading = false;

  late Pagination<E> pagination;

  String pageUrl;

  dynamic fromJson = (json) => {};

  PaginationState(this.pageUrl, dynamic fromJson) {
    this.pagination = Pagination(pageUrl);
    this.fromJson = fromJson;
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        //滑动到了底部判断
        doInfinite(); //上拉加载更多
      }
    });
  }

  void refreshState(Response response, {bool concat = false}) {
    PageResponse data = PageResponse.fromJson(json.decode(json.encode(response.data)), fromJson);
    setState(() {
      this.pagination.covertResponse(data);
      if (concat) {
        this.pagination.content = [...?this.pagination.content, ...data.content];
      } else {
        this.pagination.content = [...data.content];
      }
      loading = false;
    });
  }

  /**
   * 重新加载
   */
  reload() {
    loading = true;
    if (this.pagination.content != null && this.pagination.content!.isNotEmpty) {
      EasyLoading.show(status: 'loading...');
    }
    this.pagination.reload().then((value) => refreshState(value)).whenComplete(() {
      loading = false;
      EasyLoading.dismiss();
    });
  }

  /**
   * 刷新
   */
  refresh([bool concat = false]) {
    loading = true;
    this.pagination.refresh().then((value) {
      refreshState(value, concat: concat);
    }, onError: (error) {}).whenComplete(() => loading = false);
  }

  /**
   * 最后一页
   */
  bool isLast() {
    return this.pagination.isLast();
  }

  /**
   * 跳转到pageIndex
   */
  toPage(int pageIndex) {
    this.pagination.pageIndex = pageIndex;
    refresh();
  }

  nextPage([bool concat = false]) {
    this.pagination.nextPage();
    this.refresh(concat);
  }

  /**
   * 重置
   */
  reset() {
    loading = true;
    this.pagination.reset().then((value) {
      PageResponse data = PageResponse.fromJson(json.decode(json.encode(value.data)), fromJson);
      setState(() {
        this.pagination.covertResponse(data);
        this.pagination.content = [...data.content];
      });
    }).whenComplete(() => loading = false);
  }

  /**
   * 下拉刷新
   */
  Future<Null> doRefresh() async {
    reload();
  }

  /**
   * 上拉加载更多
   */
  Future doInfinite() async {
    if (!loading) {
      //判断是否加载数据
      setState(() {
        loading = true; //改成正在加载数据，防止下次滑动重复加载
        if (!this.pagination.isLast()) {
          nextPage(true);
        }
      });
    }
  }

  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget buildInfiniteWidget() {
    List<Widget> widget =
        isLast() ? [Text(BaseConstants.END_PROMPT, style: NO_MORE_TEXT.copyWith())] : [Text(BaseConstants.LOADING, style: Theme.of(context).textTheme.labelMedium), CircularProgressIndicator(strokeWidth: 1.0)];
    return Center(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget,
            )));
  }

  /**
   * 生成分页内容区
   */
  Widget buildContent({required IndexedWidgetBuilder itemBuilder, IndexedWidgetBuilder? separatorBuilder, Color? backgroundColor, List<Widget>? topWidgets, Widget? emptyContent}) {
    return RefreshIndicator(
        onRefresh: doRefresh,
        // color: Colors.blue,
        backgroundColor: backgroundColor,
        child: Column(children: [
          if (topWidgets != null && topWidgets.isNotEmpty) ...topWidgets,
          if (pagination.content.isNotEmpty)
            Expanded(
                child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    itemCount: pagination.content!.length,
                    itemBuilder: (context, index) {
                      return itemBuilder(context, index);
                    },
                    separatorBuilder: (context, index) {
                      return separatorBuilder != null ? separatorBuilder(context, index) : dividerFull;
                    })),
          buildPaginationBottom()
        ]));
  }

  Widget buildPaginationBottom() {
    if (pagination.content.isNotEmpty) {
      return buildInfiniteWidget();
    } else if (loading) {
      return buildInfiniteWidget();
    } else {
      return EmptyContent();
    }
  }

  @override
  void dispose() {
    super.dispose();
    //移除监听
    scrollController.dispose();
  }

  void addFilterFields(List<FilterField> filterFields) {
    this.pagination.filterFields.addAll(filterFields);
  }

  List<Widget> buildFilterFields() {
    List<Widget> widgets = this.pagination.filterFields.map((e) => _buildFilterField(e)).toList();
    // widgets.add();
    return widgets;
  }

  Builder buildBackButton() {
    return Builder(builder: (BuildContext context) {
      final ScaffoldState? scaffold = Scaffold.maybeOf(context);
      final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
      final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
      final bool canPop = parentRoute?.canPop ?? false;
      if (hasEndDrawer && canPop) {
        return BackButton();
      } else {
        return SizedBox.shrink();
      }
    });
  }

  ///生成过滤条件控件
  Widget buildFilterDrawer(BuildContext context, String title, {double? toolbarHeight, double? bottomNavigationBarHeight, Color? dividerColor}) {
    return Drawer(
        child: Scaffold(
            appBar: AppBar(toolbarHeight: toolbarHeight ?? 42.0, title: Text(title, style: Theme.of(context).textTheme.labelMedium)),
            body: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Form(
                    key: queryFormKey, //设置globalKey，用于后面获取FormState
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(children: buildFilterFields()))),
            bottomNavigationBar: Container(
                height: bottomNavigationBarHeight != null ? bottomNavigationBarHeight : 54.0,
                decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: dividerColor != null ? dividerColor : ThemeColor.borderColor))),
                child: Flex(direction: Axis.horizontal, children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 48,
                          child: TextButton(
                              child: Text("重置", style: TextStyle(color: Colors.black)),
                              onPressed: () {
                                reset();
                                Navigator.pop(context);
                              }))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 48,
                          child: ElevatedButton(
                              child: Text("确定", style: TextStyle(color: Colors.white)),
                              style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.blue), shape: WidgetStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                              onPressed: () {
                                FormState formState = (queryFormKey.currentState as FormState);
                                formState.save();
                                reload();
                                Navigator.pop(context);
                              })))
                ]))));
  }

  Widget _buildFilterField(field) {
    if (field is NumberFilterField) {
      return createNumberField(field);
    } else if (field is NumberRangeFilterField) {
      return createNumberRangeField(field);
    } else if (field is TextFilterField) {
      return createTextFilter(field);
    } else if (field is DateFilterField) {
      return createDateFilter(field);
    } else if (field is DateRangeFilterField) {
      return createDateRangeFilter(field);
    } else if (field is RadioRangeFilterField) {
      return createRadioField(field);
    } else if (field is SelectRangeFilterField) {
      // return createDropdownButtonFormField(field);
      return Text("");
    } else {
      return createTextFilter(field);
    }
  }

  Widget createTextFilter(FilterField field) {
    return TextFormField(
        style: TextStyle(fontSize: 14, color: Color(0xff959595)),
        initialValue: field.value,
        onSaved: (value) => {field.value = value},
        decoration: InputDecoration(labelText: field.label, labelStyle: labelStyle, hintText: field.hint, hintStyle: hintStyle));
  }

  Widget createNumberField(NumberFilterField field) {
    return TextFormField(
      initialValue: field.value,
      autofocus: true,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 14, color: Color(0xff959595)),
      onSaved: (value) => {field.value = value},
      decoration: InputDecoration(
        labelText: field.label,
        labelStyle: TextStyle(overflow: TextOverflow.ellipsis, color: Color(0xff20262E), fontSize: 14),
        hintText: field.hint,
        hintStyle: TextStyle(fontSize: 14, color: Color(0xff959595)),
      ),
    );
  }

  Widget createNumberRangeField(FilterField field) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            initialValue: field.value,
            autofocus: true,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14, color: Color(0xff959595)),
            textAlign: TextAlign.center,
            onSaved: (value) => {field.value = value},
            decoration: InputDecoration(
              labelText: field.label,
              labelStyle: TextStyle(overflow: TextOverflow.ellipsis, color: Color(0xff20262E), fontSize: 14),
              hintText: field.hint,
              hintStyle: TextStyle(fontSize: 14, color: Color(0xff959595)),
            ),
          ),
        ),
        Container(margin: EdgeInsets.fromLTRB(8, 0, 8, 0), child: Text("——")),
        Expanded(
            flex: 1,
            child: TextFormField(
              initialValue: field.value,
              autofocus: true,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 14, color: Color(0xff959595)),
              textAlign: TextAlign.center,
              onSaved: (value) => {field.value = value},
              decoration: InputDecoration(
                hintText: field.hint,
                hintStyle: TextStyle(fontSize: 14, color: Color(0xff959595)),
              ),
            ))
      ],
    );
  }

  Widget createRadioField(RadioRangeFilterField field) {
    List<Widget> widgets = [];
    if (field.items != null && field.items!.isNotEmpty) {
      for (var i = 0; i < field.items!.length; i++) {
        if (i % 2 == 0) {
          widgets.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // field.items[i].checked = true;
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(4, 2, 4, 2),
                  child: RawChip(
                    label: Text(field.items![i].label),
                  ),
                ),
              ),
              i < field.items!.length - 1
                  ? GestureDetector(
                      // onTap: (){
                      //   checked = true;
                      // },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: RawChip(
                          label: Text(field.items![i + 1].label),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ));
        }
      }
    }
    return Container(
      margin: EdgeInsets.only(top: 14, left: 18, bottom: 14),
      child: Column(children: widgets),
    );
  }

  Widget createDateFilter(DateFilterField field) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(18))),
      height: 40,
      padding: EdgeInsets.only(left: 18, right: 18),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
          Pickers.showDatePicker(
            context,
            // 模式，详见下方
            mode: DateMode.YMD,
            // 后缀 默认Suffix.normal()，为空的话Suffix()
            suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
            // 默认选中
            // selectDate: field.initialValue != null ? PDuration.parse(initialValue) : null,
            onConfirm: (p) {
              // field.value = p.year!.toString() + "-" + DateFormatUtil.prefixInteger(p.month, 1) + "-" + DateFormatUtil.prefixInteger(p.day, 1);
              // field.didChange(value);
              // changed == null ? {} : changed(value);
              setState(() {});
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //右侧的默认日期时间和下拉箭头
          children: [
            // 回显日期
            Text(
              '请选择日期',
              style: TextStyle(fontSize: 14, color: Colors.black45),
            ),
            Container(
              padding: EdgeInsets.only(left: 6),
              child: SvgPicture.asset('assets/images/svg/arrow-down.svg', width: 12, height: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget createDateRangeFilter(DateRangeFilterField field) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(2, 8, 0, 8),
          alignment: Alignment.centerLeft,
          child: Text(field.label + ':'),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 36,
                    padding: EdgeInsets.only(left: 4, right: 4),
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (currentFocus.focusedChild != null) {
                          currentFocus.focusedChild!.unfocus();
                        }
                        Pickers.showDatePicker(
                          context,
                          // 模式，详见下方
                          mode: DateMode.YMD,
                          // 后缀 默认Suffix.normal()，为空的话Suffix()
                          suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
                          // 默认选中
                          // selectDate: field.initialValue != null ? PDuration.parse(initialValue) : null,
                          onConfirm: (p) {
                            String value = p.year!.toString() + "-" + DateFormater.prefixInteger(p.month, 1) + "-" + DateFormater.prefixInteger(p.day, 1);
                            if (field.value != null) {
                              // 如果前面的值大于后面的值 则交换
                              if (field.value[1].trim() != '') {
                                var result = field.value[1].split('-');
                                if (int.parse(result[0]) < p.year! || int.parse(result[1]) < p.month! || int.parse(result[2]) < p.day!) {
                                  field.value[0] = field.value[1];
                                  field.value[1] = value;
                                  return;
                                }
                              }
                              field.value[0] = value;
                            } else {
                              field.value = [value, null];
                            }
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //右侧的默认日期时间和下拉箭头
                        children: [
                          // 回显日期
                          Text(
                            field.value != null && field.value[0] != null && field.value[0] != '' ? field.value[0] : '起始日期',
                            style: TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 6),
                            child: SvgPicture.asset('assets/images/svg/arrow-down.svg', width: 12, height: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text("—", style: AdvancedListSkeletonColor),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 36,
                    padding: EdgeInsets.only(left: 4, right: 4),
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (currentFocus.focusedChild != null) {
                          currentFocus.focusedChild!.unfocus();
                        }
                        Pickers.showDatePicker(
                          context,
                          // 模式，详见下方
                          mode: DateMode.YMD,
                          // 后缀 默认Suffix.normal()，为空的话Suffix()
                          suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
                          // 默认选中
                          // selectDate: field.initialValue != null ? PDuration.parse(initialValue) : null,
                          onConfirm: (p) {
                            String value = p.year!.toString() + "-" + DateFormater.prefixInteger(p.month, 1) + "-" + DateFormater.prefixInteger(p.day, 1);
                            if (field.value != null) {
                              // 如果后面的值小于前面的值 则交换
                              if (field.value[0].trim() != '') {
                                var result = field.value[0].split('-');
                                if (int.parse(result[0]) > p.year! || int.parse(result[1]) > p.month! || int.parse(result[2]) > p.day!) {
                                  field.value[1] = field.value[0];
                                  field.value[0] = value;
                                  return;
                                }
                              }
                              field.value[1] = value;
                            } else {
                              field.value = [null, value];
                            }
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //右侧的默认日期时间和下拉箭头
                        children: [
                          // 回显日期
                          Text(
                            field.value != null && field.value[1] != null && field.value[1] != '' ? field.value[1] : '结束日期',
                            style: TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 6),
                            child: SvgPicture.asset('assets/images/svg/arrow-down.svg', width: 12, height: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
