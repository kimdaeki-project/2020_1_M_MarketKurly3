<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productSelect.css">
	<c:import url="../template/boot.jsp"></c:import>
	</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<div class="product">
<section class="panel">
      <div class="panel-body">
          <div class="col-md-6">
              <div class="pro-img-details">
                  <img src="../resources/images/1538037871289y0.jpg" alt="">
              </div>
              <div class="pro-img-list">
                  <a href="#">
                      <img src="http://thevectorlab.net/flatlab/img/product-list/pro-thumb-1.jpg" alt="">
                  </a>
                  <a href="#">
                      <img src="http://thevectorlab.net/flatlab/img/product-list/pro-thumb-2.jpg" alt="">
                  </a>
                  <a href="#">
                      <img src="http://thevectorlab.net/flatlab/img/product-list/pro-thumb-3.jpg" alt="">
                  </a>
                  <a href="#">
                      <img src="http://thevectorlab.net/flatlab/img/product-list/pro-thumb-1.jpg" alt="">
                  </a>
              </div>
          </div>
          <div class="col-md-6">
              <h4 class="pro-d-title">
                  <a href="#" class="">
                      [푸드렐라] 통통살 가라아게
                  </a>
              </h4>
              <p>
             	     육즙이 가득한 풍성한 맛
              </p>
              <div class="product_meta">
                  <span class="posted_in"> <strong>Categories:</strong><a rel="tag" href="#">T-shirt</a>.</span>
              </div>
              <div class="product_meta">
                  <span class="posted_in"> <strong>Categories:</strong><a rel="tag" href="#">T-shirt</a>.</span>
              </div>
              <div class="product_meta">
                  <span class="posted_in"> <strong>Categories:</strong><a rel="tag" href="#">T-shirt</a>.</span>
              </div>
              <div class="product_meta">
                  <span class="posted_in"> <strong>Categories:</strong><a rel="tag" href="#">T-shirt</a>.</span>
              </div>
              <div class="product_meta">
                  <span class="posted_in"> <strong>Categories:</strong><a rel="tag" href="#">T-shirt</a>.</span>
              </div>
              
              
              
              <div class="m-bot15"> <strong>Price : </strong> <span class="amount-old">$544</span>  <span class="pro-price"> $300.00</span></div>
              <div class="form-group">
                  <label>Quantity</label>
                  <input type="quantiy" placeholder="1" class="form-control quantity">
              </div>
              <p>
                  <button class="btn btn-round btn-danger" type="button"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
              </p>
          </div>
      </div>
  </section>
  </div>
  </div>
  </div>
  
  
  
  
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>