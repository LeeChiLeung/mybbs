
<#--<#include "header.ftl">-->
<body>

<link href="${path!}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path!}/js/jquery-3.2.1.js"></script>
<script src="${path!}/js/bootstrap.min.js"></script>
<script src="${path!}/js/js.red.js"></script>

<div class="container-fluid">
    <!--导航栏-->
    <div>

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <#--<a class="navbar-brand" href="#"><img src="../img/logo2.png" height="100%"></a>a-->
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Java学院 <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">IOS学院</a></li>
                        <li><a href="#">C++学院</a></li>
                        <li><a href="#">UI设计学院</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">全部学院 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Java学院</a></li>
                                <li><a href="#">IOS学院</a></li>
                                <li><a href="#">C++学院</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">UI设计学院</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">网络营销学院</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
    <!--图片轮播-->
    <div>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="../img/okwu.jpg" alt="">
                    <div class="carousel-caption">
                        <p>aaaa</p>
                    </div>
                </div>
                <div class="item">
                    <img src="../img/okwu-athletics.jpg" alt="">
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="item">
                    <img src="../img/bartlesvillecf.jpg" alt="">
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="item">
                    <img src="../img/emancipation.jpg" alt="">
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>

            <!--显示上一个和下一个的图标-->
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!--信息展示-->
    <div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <h2>WelCome</h2>
            <p>WelCome to HeiMa!WelCome to HeiMa!WelCome to HeiMa!</p>
            <p><a href="#" class="btn btn-primary pull-right">See More</a></p>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <h2>Our Team</h2>
            <p>Our Team,Our Team,Our Team,Our Team,Our Team,Our Team</p>
            <p><a href="#" class="btn btn-primary pull-right">See More</a></p>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12">
            <h2>About Us</h2>
            <p>About Us,About Us,About Us,About Us,About Us,About Us</p>
            <p><a href="#" class="btn btn-primary pull-right">See More</a></p>
        </div>
    </div>
</div>

<#--<!-- 引入footer文件 &ndash;&gt;-->
<#--<#include "footer.ftl">-->
</body>