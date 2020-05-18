<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:forEach items="${list}" var="vo">
<tr>
										<td id="thSelect" class="goods_check">
											
												<label class="label_check checked">
													
													<input type="checkbox" class="c1" name="ico_check" id="ch${status.index}" value="31176">
												</label>
									
							
										</td>
										<td header="thInfo" class="goods_thumb"><!-- 상품 정보 -->
											<a href="링크걸기" class="thumb">
												<c:forEach items="${vo.productFileVOs}" var="pf">
												<img src="${pageContext.request.contextPath}/resources/uploadproduct/${pf.fileName}" alt="상품 이미지" onerror=""> 
												</c:forEach>
											</a>
										</td>
										<c:forEach items="${vo.productVOs}" var="pro">
										<td header="thInfo" class="goods_info">
											<a href="링크걸기" class="name">
												
												${pro.p_name}
												
											</a>
											<dl class="goods_cost">
												<dt class="screen_out">판매 가격</dt>
												<dd class="selling_price">
													<span class="num proPrice" id="proPrice${status.index}">${pro.price}</span>
													<span class="txt">원</span>
												</dd>
											</dl>
										</td>
										 </c:forEach>
										<td header="thInfo" class="goods_condition">
											<div class="condition">
												
											</div>
										</td>
										<td header="thCount">
											<div class="goods_quantity">
											<div class="quantity">
												<input type="hidden" id="${vo.cq_num}" class="cqn${status.index}">
												<input type="hidden" name="curCnt${status.index}" value="${vo.count}">
												<strong class="screen_out">수량</strong>
												<button type="button" class="btn btn_reduce d${status.index}" onclick="del(${status.index});">
													<img src="${pageContext.request.contextPath}/resources/images/ico_minus_24x4.png" alt="감소">
												</button>
												
												<input type="text" readonly="readonly" class="inp_quantity re${status.index}" id="re${status.index}" value="${vo.count}">
												
									
												<%-- <input type="text" readonly="readonly" class="inp_quantity re${status.index}" id="resultCount" value="${vo.count}"> --%>
												<button type="button" class="btn btn_rise u${status.index}" onclick="add(${status.index});">
													<img src="${pageContext.request.contextPath}/resources/images/ico_plus_24x4.png" alt="증가">
												</button>
											</div>
											</div>
										</td>
										<c:forEach items="${vo.productVOs}" var="pro">
										<td header="thCost">
													
											<dl class="goods_total">
												<dt class="screen_out">합계</dt>
												<dd class="result">
													<span class="num" id="resultPrice${status.index}">${vo.count * pro.price}</span>
													<span class="txt">원</span>
												</dd>
											</dl>
										</td>
										 </c:forEach>
										<td header="thDelete" class="goods_delete">
												
												<button type="button" class="btn btn_delete" id="btn_del" onclick="btnDel(${vo.cq_num});">
													<img src="${pageContext.request.contextPath}/resources/images/btn_close.jpg" alt="삭제">
												</button>
											
										</td>
									
									</tr>

</c:forEach>

