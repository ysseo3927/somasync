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
        .custom_header{
            padding: 10px;
            text-decoration: none;
            color: #FFFFFF;
            font-weight: bold;
            display: inline-block;

            border-right: 30px solid transparent;
            border-bottom: 30px solid #2D22BE;

            height: 0;
            line-height: 50px;
        }
    </style>
    <script src="/resources/js/fontawesome_.js"></script>
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script>
        $(function(){
            var nowDate = new Date();

            var nowYear = nowDate.getFullYear();
            var nowMonth = nowDate.getMonth()+1;
            var nowDt = nowDate.getDate();

            var dateVal = nowYear + "년 " + nowMonth + "월 " + nowDt + "일 ";
            var divDate = document.getElementById("currentDate");
            divDate.innerText = dateVal;
        });
    </script>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
        <a class="navbar-brand" href="#!" style="font-size:15px;"><img class="text-center" src="/resources/img/logo_small.png" style="border-radius:20%;margin-top:0px;margin-bottom:0px;" alt="...">　SomaSync Dashboard</a>
        <div id="currentDate" style="font-size:16px;font-weight: bolder"></div>
        <hr style="width:100%;color:#2D22BE;height:2px;margin-top:0px;opacity:100%;">
    </div>
</nav>

<!-- Icons Grid-->
<section class="features-icons bg-light text-center">
    <div class="container">
        <div class="row" style="padding-bottom:12px;padding-left:12px;padding-right:12px;font-size: 20px;font-weight: bolder">
            홍길동 | 1998. 5. 7. | Asthma
        </div>
        <div class="row" style="display:flex;text-align: left;color:#606060;font-weight:bold;">
            <div style="width:50%">현재 복용 중인 증상완화제</div>
            <div style="width:50%">현재 복용 중인 질병조절제</div>
        </div>
        <div class="row" style="display:flex;text-align: left;font-weight: bold;">
            <div style="width:50%">Ventolin</div>
            <div style="width:50%">Advair Diskus</div>
        </div>
        <div class="row" style="display:flex;text-align: left;font-weight: bold">
            <div style="width:50%"></div>
            <div style="width:50%">2회/일 복용</div>
        </div>
        <div style="text-align: left;font-weight: bold;">
            <div class="custom_header">최근 30일</div>건강 상태
        </div>
        <div style="border-top: 2px solid #2D22BE; ">
            <div style="display:flex;text-align: left;font-weight: bold;margin-top:5px;">
                <div style="border:1px solid #0606d7;border-radius:10px;width:50%;margin-right:10px;margin-bottom:5px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">증상완화제 사용(최근 7일)</div>
                <div style="display:flex;width:50%;">
                    <div style="border:1px solid #818181;background-color: #e3e3e3;border-radius:5px;width:50%;margin-right:10px;margin-bottom:5px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">
                        차트 영역1
                    </div>
                    <div style="border:1px solid #818181;background-color: #e3e3e3;border-radius:5px;width:50%;margin-bottom:5px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">
                        차트 영역2
                    </div>
                </div>
            </div>
            <div style="display:flex;text-align: left;font-weight: bold;margin-top:5px;">
                <div style="border:1px solid #0606d7;border-radius:5px;width:50%;margin-right:10px;margin-bottom:10px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">
                    질병 조절제 순응도<div style="text-align:center;font-size: 24px;font-weight: bold;margin-top:10px;">70%</div>
                </div>
                <div style="border:1px solid #0606d7;border-radius:5px;width:50%;margin-bottom:10px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">
                    ACT 점수<div style="text-align:center;font-size: 24px;font-weight: bold;margin-top:10px;">23.5%</div>
                </div>
            </div>
        </div>
        <div style="text-align: left;font-weight: bold;">
            <div class="custom_header">최근 30일</div>약물 사용
        </div>
        <div style="text-align: left;border-top: 2px solid #2D22BE; font-weight:bold;color:#606060">
            증상완화제 사용
        </div>
        <div style="border:1px solid #818181;text-align: left;font-weight:bold;background-color: #e3e3e3;height:100px;border-radius:5px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">
            차트 영역3
        </div>
        <div style="text-align: left;font-weight:bold;color:#606060">
            질병조절제 순응도
        </div>
        <div style="border:1px solid #818181;text-align: left;font-weight:bold;background-color: #e3e3e3;height:100px;border-radius:5px;height:120px;padding-left:10px;padding-top:10px;font-size:13px;">
            차트 영역4
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="footer bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
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

</body>
</html>
