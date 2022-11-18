<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>로그인 - SomaSync Dashboard</title>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header text-center">
                                <img class="text-center" src="/resources/img/logo_login.png" style="border-radius:20%; margin-top:30px;" alt="...">
                                <h3 class="text-center font-weight-light my-4">SomaSync Dashboard</h3>
                            </div>
                            <div class="card-body p-5">
                                <form>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail" type="email" placeholder="이메일" />
                                        <label style="font-size:14px;" for="inputEmail">이메일</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호" />
                                        <label style="font-size:14px;" for="inputPassword">비밀번호</label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <!-- <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" /> -->
                                        <!-- <label class="form-check-label" for="inputRememberPassword">Remember Password</label> -->
                                    </div>
                                    <div style="text-align:center">
                                        <!-- <a class="small" href="password.html">비밀번호 찾기</a> -->
                                        <a class="btn btn-standard" style="border-radius:21px;" href="index.html">　　　　로그인　　　　</a>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="register.html">회원가입</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2022</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
</body>
</html>