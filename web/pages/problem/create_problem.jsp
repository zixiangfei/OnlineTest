<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/2
  Time: 10:38 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    $(function () {

        $("#createProblemClose").click(function () {
            $("body").removeClass("modal-open");
            $("#createProblemModal").removeClass("in");
            $("#createProblemModal").attr("style","display:none;");
            $("#createProblemModal").attr("aria-hidden","false");
            $("#createProblemBackground").removeClass("in");
            $("#createProblemBackground").attr("style","display:none;");
        })

        $("#createProblemCancel").click(function () {
            $("#createProblemModal").removeClass("in");
            $("body").removeClass("modal-open");
            $("#createProblemModal").attr("style","display:none;");
            $("#createProblemModal").attr("aria-hidden","false");
            $("#createProblemBackground").removeClass("in");
            $("#createProblemBackground").attr("style","display:none;");

        })

        $("#contest-type-0").click(function () {
            $("#contest-type-0").addClass("active")
            $("#contest-type-1").removeClass("active")
            $("#contest-type-2").removeClass("active")
            $("#contest-type-0").children(":first").attr("checked","true");
            $("#contest-type-1").children(":first").removeAttr("checked");
            $("#contest-type-2").children(":first").removeAttr("checked");
            $("#optionA").val("");
            $("#optionB").val("");
            $("#optionC").val("");
            $("#optionD").val("");
            $("#optionA").removeAttr("disabled");
            $("#optionB").removeAttr("disabled");
            $("#optionC").removeAttr("disabled");
            $("#optionD").removeAttr("disabled");
            $("#typeSingle").attr("style","display:block");
            $("#typeMuti").attr("style","display:none");
            $("#typeBool").attr("style","display:none");
        })
        $("#contest-type-1").click(function () {
            $("#contest-type-1").addClass("active")
            $("#contest-type-0").removeClass("active")
            $("#contest-type-2").removeClass("active")
            $("#contest-type-1").children(":first").attr("checked","true");
            $("#contest-type-0").children(":first").removeAttr("checked");
            $("#contest-type-2").children(":first").removeAttr("checked");
            $("#optionA").val("");
            $("#optionB").val("");
            $("#optionC").val("");
            $("#optionD").val("");
            $("#optionA").removeAttr("disabled");
            $("#optionB").removeAttr("disabled");
            $("#optionC").removeAttr("disabled");
            $("#optionD").removeAttr("disabled");
            $("#typeSingle").attr("style","display:none");
            $("#typeMuti").attr("style","display:block");
            $("#typeBool").attr("style","display:none");
        })
        $("#contest-type-2").click(function () {
            $("#contest-type-2").addClass("active")
            $("#contest-type-0").removeClass("active")
            $("#contest-type-1").removeClass("active")
            $("#contest-type-2").children(":first").attr("checked","checked");
            $("#contest-type-0").children(":first").removeAttr("checked");
            $("#contest-type-1").children(":first").removeAttr("checked");
            $("#optionA").val("");
            $("#optionB").val("");
            $("#optionC").val("");
            $("#optionD").val("");
            $("#optionA").val("正确");
            $("#optionB").val("错误");
            $("#optionC").val("无");
            $("#optionD").val("无");
            $("#optionA").attr("disabled","disabled");
            $("#optionB").attr("disabled","disabled");
            $("#optionC").attr("disabled","disabled");
            $("#optionD").attr("disabled","disabled");
            $("#typeSingle").attr("style","display:none");
            $("#typeMuti").attr("style","display:none");
            $("#typeBool").attr("style","display:block");
        })

        $("#singleA").click(function () {
            $("#singleA").removeClass("active");
            $("#singleB").removeClass("active");
            $("#singleC").removeClass("active");
            $("#singleD").removeClass("active");
            $("#singleA").children(":first").removeAttr("checked");
            $("#singleB").children(":first").removeAttr("checked");
            $("#singleC").children(":first").removeAttr("checked");
            $("#singleD").children(":first").removeAttr("checked");
            $("#singleA").children(":first").attr("checked","checked");
            $("#singleA").addClass("active");
        })
        $("#singleC").click(function () {
            $("#singleA").removeClass("active");
            $("#singleB").removeClass("active");
            $("#singleC").removeClass("active");
            $("#singleD").removeClass("active");
            $("#singleA").children(":first").removeAttr("checked");
            $("#singleB").children(":first").removeAttr("checked");
            $("#singleC").children(":first").removeAttr("checked");
            $("#singleD").children(":first").removeAttr("checked");
            $("#singleC").children(":first").attr("checked","checked");
            $("#singleC").addClass("active");
        })
        $("#singleB").click(function () {
            $("#singleA").removeClass("active");
            $("#singleB").removeClass("active");
            $("#singleC").removeClass("active");
            $("#singleD").removeClass("active");
            $("#singleA").children(":first").removeAttr("checked");
            $("#singleB").children(":first").removeAttr("checked");
            $("#singleC").children(":first").removeAttr("checked");
            $("#singleD").children(":first").removeAttr("checked");
            $("#singleB").children(":first").attr("checked","checked");
            $("#singleB").addClass("active");
        })
        $("#singleD").click(function () {
            $("#singleA").removeClass("active");
            $("#singleB").removeClass("active");
            $("#singleC").removeClass("active");
            $("#singleD").removeClass("active");
            $("#singleA").children(":first").removeAttr("checked");
            $("#singleB").children(":first").removeAttr("checked");
            $("#singleC").children(":first").removeAttr("checked");
            $("#singleD").children(":first").removeAttr("checked");
            $("#singleD").children(":first").attr("checked","checked");
            $("#singleD").addClass("active");
        })

        $("#boolA").click(function () {
            $("#boolB").removeClass("active");
            $("#boolB").children(":first").removeAttr("checked");
            $("#boolA").children(":first").attr("checked","checked");
            $("#boolA").addClass("active");
        })
        $("#boolB").click(function () {
            $("#boolA").removeClass("active");
            $("#boolA").children(":first").removeAttr("checked");
            $("#boolB").children(":first").attr("checked","checked");
            $("#boolB").addClass("active");
        })

        $("#mutiA").click(function () {
            if($("#mutiA").prop("checked")) {
                $("#mutiA").prop("checked",true);
                $("#mutiA").parent().addClass("active");
            }
            else {
                $("#mutiA").prop("checked",false);
                $("#mutiA").parent().removeClass("active");
            }
        })
        $("#mutiB").click(function () {
            if($("#mutiB").prop("checked")) {
                $("#mutiB").prop("checked",true);
                $("#mutiB").parent().addClass("active");
            }
            else {
                $("#mutiB").prop("checked",false);
                $("#mutiB").parent().removeClass("active");
            }
        })
        $("#mutiC").click(function () {
            if($("#mutiC").prop("checked")) {
                $("#mutiC").parent().addClass("active");
            }
            else {
                $("#mutiC").prop("checked",false);
                $("#mutiC").parent().removeClass("active");
            }
        })
        $("#mutiD").click(function () {
            if($("#mutiD").prop("checked")) {
                $("#mutiD").prop("checked",true);
                $("#mutiD").parent().addClass("active");
            }
            else {
                $("#mutiD").prop("checked",false);
                $("#mutiD").parent().removeClass("active");
            }
        })

        $("#createProblemReset").click(function () {
            $("#contest-type-0").removeClass("active")
            $("#contest-type-1").removeClass("active")
            $("#contest-type-2").removeClass("active")
            $("#contest-type-0").children(":first").removeAttr("checked");
            $("#contest-type-1").children(":first").removeAttr("checked");
            $("#contest-type-2").children(":first").removeAttr("checked");
            $("[name='describe']").val("");
            $("[name='analysis']").val("");
            $("#optionA").val("");
            $("#optionB").val("");
            $("#optionC").val("");
            $("#optionD").val("");
            $("#singleA").removeClass("active");
            $("#singleB").removeClass("active");
            $("#singleC").removeClass("active");
            $("#singleD").removeClass("active");
            $("#singleA").children(":first").removeAttr("checked");
            $("#singleB").children(":first").removeAttr("checked");
            $("#singleC").children(":first").removeAttr("checked");
            $("#singleD").children(":first").removeAttr("checked");
            $("#mutiA").removeAttr("checked");
            $("#mutiB").removeAttr("checked");
            $("#mutiC").removeAttr("checked");
            $("#mutiD").removeAttr("checked");
            $("#mutiA").parent().removeClass("active");
            $("#mutiB").parent().removeClass("active");
            $("#mutiC").parent().removeClass("active");
            $("#mutiD").parent().removeClass("active");
            $("#boolA").removeClass("active");
            $("#boolA").children(":first").removeAttr("checked");
            $("#boolB").removeClass("active");
            $("#boolB").children(":first").removeAttr("checked");
        })

        $("#btn-confirm").click(function () {
            if($("[name='type']:checked").length<1) {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("请选择题目类型");
                return false;
            }
            if($("[name='describe']").val()==null||$("[name='describe']").val()==="") {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("题目表述不能为空");
                return false;
            }
            if($("[name='analysis']").val()==null||$("[name='analysis']").val()==="") {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("题目解析不能为空");
                return false;
            }
            if($("#optionA").val()==null||$("#optionA").val()==""||
                $("#optionB").val()==null||$("#optionB").val()==""||
                $("#optionC").val()==null||$("#optionC").val()==""||
                $("#optionD").val()==null||$("#optionD").val()=="") {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("选项不能为空");
                return false;
            }
            if($("[name='single']:checked").length<1&&$("[name='muti']:checked").length<1&&$("[name='bool']:checked").length<1) {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("请设置正确答案");
                return false;
            }

            $("#edit-alert").attr("style","display:none");

        })

    })

</script>
<link type="text/css" rel="stylesheet" href="static/css/create_problem.css">
<div class="modal fade" id="createProblemModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
    <div class="modal-dialog modal-lg" role="document">
        <form action="problemServlet" id="createProblemForm">
            <input hidden="hidden" name="action" value="createProblem">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="createProblemClose">
                        <span>×</span>
                    </button>
                    <h4 class="modal-title" id="editContestModalLabel">创建题目</h4>
                </div>
                <div class="modal-body">
                    <h4 id="panel-info">题目信息</h4>
                    <div class="card-block">
                        <div class="form-group row">
                            <label for="contest-type" class="col-xs-2 col-form-label">类型</label>
                            <div class="btn-group col-xs-10 " data-toggle="buttons" id="contest-type">
                                <label class="btn btn-secondary " id="contest-type-0">
                                    <input type="radio" name="type"  value="单选">
                                    单选
                                </label>
                                <label class="btn btn-secondary" id="contest-type-1">
                                    <input type="radio" name="type"  value="多选">
                                    多选
                                </label>
                                <label class="btn btn-secondary" id="contest-type-2">
                                    <input type="radio" name="type" value="判断">
                                    判断
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="selectSubject" class="col-xs-2 col-form-label">科目</label>
                            <div class="col-xs-10">
                                <select id="selectSubject" class="custom-select" v="oj" name="subject">

                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="contest-announcement-edit" class="col-xs-2 col-form-label">题目描述</label>
                            <div class="col-xs-10">
                            <textarea class="form-control" name="describe" id="contest-announcement-edit" rows="5" data-original-title="" title=""></textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="contest-description-edit" class="col-xs-2 col-form-label">题目解析</label>
                            <div class="col-xs-10">
                                <textarea class="form-control" name="analysis" id="contest-description-edit" rows="5" data-original-title="" title=""></textarea>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <h4 id="panel-problems">选项设置</h4>

                    <div class="card-block">

                    <div class="form-group row">
                        <label for="optionA" class="col-xs-2 col-form-label">A</label>
                        <div class="col-xs-10">
                            <input class="form-control" type="text" id="optionA" name="optionA">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="optionB" class="col-xs-2 col-form-label">B</label>
                        <div class="col-xs-10">
                            <input class="form-control" type="text" id="optionB" name="optionB">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="optionC" class="col-xs-2 col-form-label">C</label>
                        <div class="col-xs-10">
                            <input class="form-control" type="text" id="optionC" name="optionC">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="optionD" class="col-xs-2 col-form-label">D</label>
                        <div class="col-xs-10">
                            <input class="form-control" type="text" id="optionD" name="optionD">
                        </div>
                    </div>
                        <div class="form-group row">
                            <label for="contest-type" class="col-xs-2 col-form-label">正确答案</label>
                            <%--                        单选--%>
                            <div class="btn-group col-xs-10 " style="display: none" data-toggle="buttons" id="typeSingle">
                                <label class="btn btn-secondary " id="singleA">
                                    <input type="radio" name="single"  value="A">
                                    A
                                </label>
                                <label class="btn btn-secondary" id="singleB">
                                    <input type="radio" name="single"  value="B">
                                    B
                                </label>
                                <label class="btn btn-secondary" id="singleC">
                                    <input type="radio" name="single" value="C">
                                    C
                                </label>
                                <label class="btn btn-secondary" id="singleD">
                                    <input type="radio" name="single" value="D">
                                    D
                                </label>
                            </div>
                            <%--                        多选--%>
                            <div class="btn-group col-xs-10 " style="display: none" data-toggle="buttons" id="typeMuti">
                                <label class="btn btn-secondary " >
                                    <input type="checkbox" name="muti"   value="A" id="mutiA">
                                    A
                                </label>
                                <label class="btn btn-secondary" >
                                    <input type="checkbox" name="muti"  value="B" id="mutiB">
                                    B
                                </label>
                                <label class="btn btn-secondary" >
                                    <input type="checkbox" name="muti"  value="C" id="mutiC">
                                    C
                                </label>
                                <label class="btn btn-secondary" >
                                    <input type="checkbox" name="muti"  value="D" id="mutiD">
                                    D
                                </label>
                            </div>
                            <%--                        判断--%>
                            <div class="btn-group col-xs-10 " style="display: none" data-toggle="buttons" id="typeBool">
                                <label class="btn btn-secondary " id="boolA">
                                    <input type="radio" name="bool"  value="A">
                                    A
                                </label>
                                <label class="btn btn-secondary" id="boolB">
                                    <input type="radio" name="bool"  value="B">
                                    B
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="alert alert-danger" role="alert" id="edit-alert" style="display: none"></div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="createProblemCancel">取消</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="createProblemReset">重制</button>
                    <button type="submit" class="btn btn-primary" id="btn-confirm">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="modal-backdrop fade" style="display: none" id="createProblemBackground"></div>
