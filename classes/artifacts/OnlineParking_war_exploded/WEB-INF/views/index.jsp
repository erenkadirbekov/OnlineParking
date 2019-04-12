<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SmartParking</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/modern-business.css" rel="stylesheet">

</head>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index">SmartParking</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="about.html">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="services.html">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        For Drivers
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                        <a class="dropdown-item" href="portfolio-2-col.html">Find Parking</a>
                        <a class="dropdown-item" href="faq.html">FAQ</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Rent out Driveway
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog1">
                        <a class="dropdown-item" href="blog-home-1.html">Car Park Management</a>
                        <a class="dropdown-item" href="faq.html">FAQs</a>
                        <a class="dropdown-item" href="blog-post.html">Blog Post</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Nurzhan
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog2">
                        <a class="dropdown-item" href="sidebar.html">Dasboard</a>
                        <a class="dropdown-item" href="faq.html">FAQ</a>
                        <a class="dropdown-item" href="404.html">404</a>

                    </div>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-success" href="/loginPage">Login</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-success" href="/registrationPage">Sign Up</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('http://hathcockonline.com/images/awnings/carport.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Find parkings in seconds!</h3>
                    <p>Find your favorite parking space among thousands of spots.</p>
                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('https://www.mlunderwoodconstruction.com/zupload/library/15/-98-1900x1080-0.jpg?ztv=20151211155259')">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Easy of Use</h3>
                    <p>We make all the source accesseble and comfortable.</p>
                </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('https://invexo.com.br/wp-content/uploads/condominio/20181128072747-garagem.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Rent out your driveway!</h3>
                    <p>You are welcome to rent out your parking space.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>
<br><br><br>
<!-- Page Content -->
<div class="container">

    <!-- Portfolio Section -->
    <center><h2>Parkings are made easy</h2></center>
    <br><br>

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="https://st2.depositphotos.com/5266903/11959/v/950/depositphotos_119595756-stock-illustration-location-stroke-vector-icon.jpg" alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="#">Wherever, whenever</a>
                    </h4>
                    <p class="card-text">Choose from millions of spaces across the UK
                        Find your best option for every car journey</p>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="https://previews.123rf.com/images/magurok/magurok1408/magurok140800069/30735457-vector-credit-card-flat-icon.jpg" alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="#">Peace of mind</a>
                    </h4>
                    <p class="card-text">View information on availability, price and restrictions
                        Reserve in advance at over 45,000+ locations</p>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAk7-aaRHvlE8LjvxU3CeycxmkzY4tzCa8rvq_6InqwSC8YC8p" alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="#">Seamless experience</a>
                    </h4>
                    <p class="card-text">Pay for JustPark spaces via the app or website
                        Follow easy directions and access instructions</p>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->
    <br><br><br><br><br>
    <!-- Features Section -->
    <div class="row">
        <div class="col-lg-6">
            <h2>Rent out your parking space</h2>
            <p>Make easy tax free money by renting out your parking space. It‘s free to list and only takes a few minutes to get up and running.</p>
            <p>Increase revenue with marketing to over 1.5 million drivers via our app and website</p>
        </div>
        <div class="col-lg-6">
            <img class="img-fluid rounded" src="http://www.crestmont-inn.com/wp-content/uploads/2018/10/parking-cp-640x230.jpg" alt="">
        </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="row mb-4">
        <div class="col-md-8">
            <p>Boost returns by up to 100% with our award-winning dynamic pricing system
                Monitor and analyse your performance with ease via our online reporting software</p>
        </div>
        <div class="col-md-4">
            <a class="btn btn-lg btn-outline-success btn-block" href="#">Learn How to earn today!</a>
        </div>
    </div>

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Smart Parking 2019</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>






