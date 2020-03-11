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
            var trId = row.id;
            var operateBtn = [
                '<@shiro.hasPermission name="tag:add"><a class="btn btn-sm btn-success btn-update" data-id="' + trId + '"title="导入推广数据"><i class="fa fa-plus fa-fw"></i></a></@shiro.hasPermission>',
            ];
            return operateBtn.join('');
        }

        $(function () {
            var options = {
                modalName: "选品库",
                url: "/import/list",
                getInfoUrl: "",
                updateUrl: "",
                removeUrl: "",
                createUrl: "/import/add",
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
            var table = new Table(options);
            table.init();
        });
    </script>
</@footer>