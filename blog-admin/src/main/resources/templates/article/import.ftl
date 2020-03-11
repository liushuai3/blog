<#include "/include/macros.ftl">
<@header></@header>
<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <@breadcrumb>
                <ol class="breadcrumb">
                    <li><a href="/">首页</a></li>
                    <li class="active">选品库</li>
                </ol>
            </@breadcrumb>
            <div class="x_panel">
                <div class="x_content">
                    <table id="tablelist">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<@footer>
    <script>
        /**
         * 操作按钮
         * @param code
         * @param row
         * @param index
         * @returns {string}
         */
        function operateFormatter(code, row, index) {
            var operateBtn = [
                /*'<@shiro.hasPermission name="import:add"><button id="btn_import" type="button" onclick="importData(this)" class="btn btn-info" title="导入该选品库数据"><i class="fa fa-plus fa-fw"></i></button></@shiro.hasPermission>'*/
                '<button id="btn_import" type="button" onclick="importData(this)" class="btn btn-info" title="导入该选品库数据"><i class="fa fa-plus fa-fw"></i></button>'
            ];
            return operateBtn.join('');
        }
        var table ;
        $(function () {
            var options = {
                modalName: "选品库",
                url: "/import/list",
                getInfoUrl: "",
                updateUrl: "",
                removeUrl: "",
                createUrl: "",
                search: false,
                columns: [
                    {
                        field: 'favorites_id',
                        title: '选品库ID',
                        width: '60px',
                        formatter: function (code) {
                            return code ? code : '-';
                        }
                    },
                    {
                        field: 'favorites_title',
                        title: '选品库名称',
                        width: '150px',
                        formatter: function (code) {
                            return code ? code : '-';
                        }
                    },
                    {
                        field: 'type',
                        title: '选品库类型',
                        width: '60px',
                        formatter: function (code) {
                            return code ? code : '-';
                        }
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        align: "center",
                        width: '100px',
                        formatter: operateFormatter //自定义方法，添加操作按钮
                    }
                ]
            };
            // 初始化table组件
            table = new Table(options);
            table.init();
        });
        function importData(th) {
            var favoritesId =  $(th).parent().parent().children()[0].innerHTML;
            $.ajax({
                type: "post",
                url: "/import/add",
                traditional: true,
                data: {'favoritesId': favoritesId},
                success: function (json) {
                    console.info("导入数据成功");
                    $.alert.ajaxSuccess(json);
                    table.refresh();
                },
                error: $.alert.ajaxError
            });

        }
    </script>
</@footer>