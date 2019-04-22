<%--
  Created by IntelliJ IDEA.
  User: Тынышбай Нуржан
  Date: 22.04.2019
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">



    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6 offset-md-3">

                <!-- form card cc payment -->
                <div class="card card-outline-secondary">
                    <div class="card-body">
                        <h3 class="text-center">Credit Card Payment</h3>
                        <hr>
                        <div class="alert alert-info p-2 pb-3">
                            <a class="close font-weight-normal initialism" data-dismiss="alert" href="#"><samp>&times;</samp></a>
                            CVC code is required.
                        </div>
                        <form class="form" role="form" autocomplete="off">
                            <div class="form-group">
                                <label for="cc_name">Card Holder's Name</label>
                                <input type="text" class="form-control" id="cc_name" pattern="\w+ \w+.*" title="First and last name" required="required">
                            </div>
                            <div class="form-group">
                                <label>Card Number</label>
                                <input type="text" class="form-control" autocomplete="off" maxlength="20" pattern="\d{16}" title="Credit card number" required="">
                            </div>
                            <div class="form-group row">
                                <label class="col-md-12">Card Exp. Date</label>
                                <div class="col-md-4">
                                    <select class="form-control" name="cc_exp_mo" size="0">
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" name="cc_exp_yr" size="0">
                                        <option>2018</option>
                                        <option>2019</option>
                                        <option>2020</option>
                                        <option>2021</option>
                                        <option>2022</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" autocomplete="off" maxlength="3" pattern="\d{3}" title="Three digits at back of your card" required="" placeholder="CVC">
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-md-12">Amount</label>
                            </div>
                            <div class="form-inline">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                    <input type="text" class="form-control text-right" id="exampleInputAmount" placeholder="39">
                                    <div class="input-group-append"><span class="input-group-text">.00</span></div>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <button type="reset" class="btn btn-default btn-lg btn-block">Cancel</button>
                                </div>
                                <div class="col-md-6">
                                    <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /form card cc payment -->
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
