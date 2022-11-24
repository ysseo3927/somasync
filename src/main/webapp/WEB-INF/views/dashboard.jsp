<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SomaSync Dashboard</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/dashboard_styles.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/resources/css/jquery.datetimepicker.css"/>
        <style>
            .grid-cell-centered-and-bold {
                text-align: left;
            }
            .ag-cell-focus,.ag-cell-no-focus{
                border:none !important;
            }
            /* This CSS is to not apply the border for the column having 'no-border' class */
            .no-border.ag-cell:focus{
                border:none !important;
                outline: none;
            }
        </style>
        <script src="/resources/js/all.js"></script>
        <script src="/resources/vendor/jquery/jquery.min.js"></script>
        <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="/resources/vendor/ag-grid/ag-grid-community.min.js"></script>
        <script src="/resources/js/jquery.datetimepicker.full.min.js"></script>
        <script>

            const columnDefs = [
                { field: "No", sortable: false, cellClass: "grid-cell-centered-and-bold"},
                { field: "성명" , sortable: true, minWidth: 200, cellClass: "grid-cell-centered-and-bold"},
                { field: "생년월일" , sortable: true, minWidth: 150, cellClass: "grid-cell-centered-and-bold"},
                { field: "질병" , sortable: true, minWidth: 170, cellClass: "grid-cell-centered-and-bold"},
                { field: "치료기간" , sortable: true, minWidth: 200, cellClass: "grid-cell-centered-and-bold"},
                { field: "리뷰기간" , sortable: true, minWidth: 150, cellClass: "grid-cell-centered-and-bold no-border", cellRenderer: CustomCombobox},
                { field: "리포트" , sortable: true, minWidth: 80, cellRenderer: function(params) {
                        return '<span onclick="openReport('+params.data.No+')"><i class="fa-solid fa-pen-to-square"></i>' + params.value + '</span>'
                    } },
                { field: "비고" , sortable: true, minWidth: 235, cellClass: "grid-cell-centered-and-bold"}
            ];

            // specify the data
            const rowData = [
                { No: "1", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "2", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "3", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "4", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "5", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "6", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "7", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "8", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "9", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01-05 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "10", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01095 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "11", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01095 ~", 리뷰기간: "30일", 리포트:"조회"},
                { No: "12", 성명: "홍길동", 생년월일: "1998-05-07", 질병:"천식(Asthma)", 치료기간: "2005-01095 ~", 리뷰기간: "30일", 리포트:"조회"},
            ];

            // let the grid know which columns and what data to use
            const gridOptions = {
                columnDefs: columnDefs,
                rowData: rowData,
                debounceVerticalScrollbar: true,
                defaultColDef: {
                    resizable: true,
                },
                pagination: true,
                paginationPageSize: 100
                //paginationAutoPageSize: true
            };

            // setup the grid after the page has finished loading
            document.addEventListener('DOMContentLoaded', () => {
                const gridDiv = document.querySelector('#myGrid');
                new agGrid.Grid(gridDiv, gridOptions);


                const allColumnIds = [];
                gridOptions.columnApi.getColumns().forEach((column) => {
                    allColumnIds.push(column.getId());
                });

                gridOptions.columnApi.autoSizeColumns(allColumnIds, false);

            });

            function CustomCombobox(params) {
                //Find RowIndex
                var rowIndex = params.rowIndex;
                //FindColoumn Name
                var Column = params.eGridCell.attributes.colId;
                //FindGridData
                var WeldGridData = gridOptions.rowData;
                //create select element using javascript
                var eSelect = document.createElement("select");
                //Set attributes
                eSelect.setAttribute('class', 'custom-select form-control');
                eSelect.setAttribute('style', 'padding:0px;text-align:center;appearance:auto;-webkit-appearance:auto;-moz-appearance:auto;font-size:14px;');
                eSelect.setAttribute('name', params.colDef.field);
                eSelect.setAttribute('id', params.colDef.field + "_" + rowIndex);

                //get the value of the select option
                //create the default option of the select element
                var eOption = document.createElement("option");
                eOption.text = "기간선택";
                eOption.value = "";
                eSelect.appendChild(eOption);
                if (params.colDef.field == "리뷰기간") {
                    var day10 = document.createElement("option");
                    day10.text = "10일";
                    day10.value = "10";
                    eSelect.appendChild(day10);
                    var day20 = document.createElement("option");
                    day20.text = "20일";
                    day20.value = "20";
                    eSelect.appendChild(day20);
                    var day30 = document.createElement("option");
                    day30.text = "30일";
                    day30.value = "30";
                    eSelect.appendChild(day30);
                }
                return eSelect;
            }
        </script>
        <script>
            function openReport(No){
                var s = document.getElementById("리뷰기간_"+(No-1));
                var term = s.options[s.selectedIndex].value;
                alert(term);

                var availWidth = screen.availWidth  // 모니터 화면의 작업 표시줄을 제외한 너비
                var availHeight =  screen.availHeight // 모니터 화면의 작업 표시줄을 제외한 높이

                var popupWidth = 800;
                var popupHeight = screen.availHeight;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY= (window.screen.height / 2) - (popupHeight / 2);

                var url = "/report";
                var name = "그래프";
                var option = "width = "+popupWidth+", height = "+popupHeight+", top = "+popupY+", left = "+popupX+", location = no"
                //window.open(url, name, option);

                var pop_title = "popupOpener" ;

                var popupWindow = window.open(url, pop_title, option) ;

                popupWindow.document.getElementById("imei").value = $("#imei").val();
                popupWindow.document.getElementById("lte").value = $("#lte").val();
                popupWindow.document.getElementById("line").value = $("#line").val();
                popupWindow.document.getElementById("carNum").value = $("#carNum").val();
                popupWindow.document.getElementById("pscarNum").value = $("#pscarNum").val();
                popupWindow.document.getElementById("ionStatus").value = $("#ionStatus").val();
                popupWindow.document.getElementById("startDatetime").value = $("#startDatetime").val();
                popupWindow.document.getElementById("endDatetime").value = $("#endDatetime").val();
            }
        </script>

    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="#!"><img class="text-center" src="/resources/img/logo_login.png" style="border-radius:20%;margin-top:0px;" alt="...">　SomaSync Dashboard</a>
                <div style="font-size:14px;">홍길동 님　<a class="btn btn-standard btn-sm" href="#signup" style="border-radius:21px;"><i class="fa fa-sign-out"></i>로그아웃</a></div>
                <hr style="width:100%;color:#2D22BE;height:2px;margin-top:6px;opacity:100%;">
            </div>
        </nav>

        <!-- Icons Grid-->
        <section class="features-icons bg-light text-center">
            <div class="container">
                <div class="row" style="padding-bottom:12px;padding-left:12px;padding-right:12px;">
                    <div style="padding-top:10px;padding-bottom:10px;border:1px solid #bcbebf; width:100%;">
                        성명
                        <input class="form-control" id="name" type="text" style="width:150px;height:30px;" data-sb-validations="required,email" data-sb-can-submit="no">　
                        생년월일
                        <input class="form-control" id="birth" type="text" style="width:150px;height:30px;" data-sb-validations="required,email" data-sb-can-submit="no">　
                        질병
                        <input class="form-control" id="diease" type="text" style="width:150px;height:30px;" data-sb-validations="required,email" data-sb-can-submit="no">　
                        치료기간
                        <input class="form-control" id="periodStart" type="text" style="width:150px;height:30px;">
                        ~
                        <input class="form-control" id="periodEnd" type="text" style="width:150px;height:30px;">　
                        <a id="searchLink" href="#" onclick="searchData()" class="btn btn-standard btn-sm" style="margin-left:20px;border-radius:21px;">　<i class="fas fa-search"></i> 조회　</a>
                    </div>
                </div>
                <div class="row">
                    <!-- 테이블 -->
                    <div id="myGrid" style="height: 621px; width:100%;" class="ag-theme-alpine"></div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                        <ul class="list-inline mb-2">
                            <li class="list-inline-item"><a href="#!">About</a></li>
                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">&copy; SomaSync Dashboard 2023. All Rights Reserved.</p>
                    </div>
                    <!--
                    <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item me-4">
                                <a href="#!"><i class="bi-facebook fs-3"></i></a>
                            </li>
                            <li class="list-inline-item me-4">
                                <a href="#!"><i class="bi-twitter fs-3"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!"><i class="bi-instagram fs-3"></i></a>
                            </li>
                        </ul>
                    </div>
                    -->
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/dashboard_scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script>
            $('#periodStart').datetimepicker();
            $('#periodEnd').datetimepicker();
            $('#birth').datetimepicker();

            jQuery('#birth').datetimepicker({
                datepicker:true,
                format:'Y-m-d',
                timepicker:false
            });

            jQuery('#periodStart').datetimepicker({
                datepicker:true,
                format:'Y-m-d',
                timepicker:false
            });

            jQuery('#periodEnd').datetimepicker({
                datepicker:true,
                format:'Y-m-d',
                timepicker:false
            });
        </script>
    </body>
</html>