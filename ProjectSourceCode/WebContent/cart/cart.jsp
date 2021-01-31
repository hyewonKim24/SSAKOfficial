    <link href="<%=request.getContextPath()%>/css/cart.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../main/header.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/22634e2e1a.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<title>ssak, 나만의 책</title>

</head>
<script>
window.FontAwesomeConfig = {
	      searchPseudoElements: true
	   }
</script>
<body>
   <div id="cart_wrap">
    <section>
        <h2>장바구니</h2>
        <form name="deleteform" id="deleteform">
        
            <div id="cart_item">
                <div class="cart_column">
                    <input type="checkbox" id="checkAll" name="checkAll" class="checkAll">
                    <label for="checkAll" class="check_img"></label>
                    <label for="checkAll" class="product_img">전체 선택</label>
                    <div class="product_info info_column">상품정보</div>
                    <div class="quantity">수량</div>
                    <div class="price">상품금액</div>
                    <div class="btn_delete"></div>
                </div>
                <c:set var = "sum" value = "0" />
                <c:if test="${not empty list}">
                <c:forEach var="n" items="${list}" varStatus="e"> 
                <ul class="list">
                    <li class="item">
                    	<input type="hidden" name="chk2" class="chk2" value="${n.cno}">
                        <input type="checkbox" id="chk${e.count}" name="chk1" class="chk1" value="${n.cno}">
                        <label for="chk${e.count}" class="check_book"></label>
                        <a href="#" class="product_img"><img src="${n.bcover}" class="img_book"></a>
                        <a href="#" class="product_info">${n.btitle}</a>
                        <div class="quantity">
                            <button type="button" id="minus" class="btn minus">-</button>
                            <input type="number" min="1" id="oamount_num" name="oamount" class="oamount" value="${n.oamount}" readonly>
                            <button type="button" class="btn plus" id="plus">+</button>
                        </div>
                        <div class="price">
                        	<input type="hidden" id="aprice" class="aprice" value="${n.bpricesales}">
                         <!-- <input type="text" id="cnt" value="${e.count}">	 --> 
                            <span id="price" class="bbprice">${n.oamount*n.bpricesales}</span>
                            <span class="won">원</span>
                        </div>
                         <button type="button" class="btn_delete_a" name="btn_delete" value="${n.cno}">&#8855;</button>
                         <!-- <input type="submit" class="btn_delete" name="btn_delete2" value="&#8855" onclick="selectDelete2()">  -->
                    </li>

					<c:if test="${n.dno!=0}">
                    <li class="custom item">
                        <div class="indent">&#9495;</div>
                        <a href="#" class="product_img"><img src="${n.dimg}" class="img_book"></a>
                        <a href="#" class="product_info">${n.ddesc}</a>

                        <div class="price">
                            <span class="dselling">${n.dprice}</span>
                            <span class="won">원</span>
                        </div>
                    </c:if>

                        <c:set var= "sum" value="${sum + (n.oamount*n.bpricesales)+n.dprice}"/>
                    </li>
                </ul>
             
               </c:forEach>
               </c:if>   
			


            <div class="bottom_line">
                <div id="cart_select">
                <input type="submit" class="select_delete" name="btn_delete" value="선택삭제" onclick="selectDelete()">
                    <input type="checkbox" id="checkAll_bottom" class="checkAll2" name="checkAll">
                    <label for="checkAll_bottom" class="check_img"></label>
                    <label for="checkAll_bottom" class="checklavel">전체 선택</label>
                </div>
                <div id="bottom_price">
                    <div class="bottom product_price">
                        <div class="price_txt">상품금액</div>
                        <span class="allselling" id="allselling"><c:out value="${sum}"/></span>
                        <span class="won">원</span>
                    </div>
                    <div class="bottom mark">+</div>
                    <div class="bottom shippingfee">
                        <div class="price_txt">배송비</div>
                        <span id="delivery">2500원</span>
                    </div>
                    <div class="bottom mark">=</div>
                    <div class="bottom total_price">
                        <div class="price_txt">결제금액</div>
                        <span class="allsum" id="REALallselling">${sum+2500}</span>
                        <span class="won">원</span>
                    </div>
                </div>
            </div>

            <button type="button" id="order">구매하기</button>
            </div>

            
        </form>
    </section>
        </div>
    <%@include file="../main/footer.jsp"%>
    
 <script>
    //선택삭제
		function selectDelete(){
    		//아무것도 선택 안되었을때 처리
			var checkRow = "";
			  $( "input[name='chk1']:checked" ).each (function (){
			    checkRow = $(this).val();
			  });
			if(checkRow==''){
				alert("삭제할 대상을 선택하세요.");
				return false;
			}	
			var frm=document.deleteform;
			frm.method="get";
			frm.action="CartDelete.do	"
			frm.submit();
		}
    
    	/*function add() {
    		var val = parseInt(document.getElementById("oamount_num").value);
    		val = val+1;
    		var apr= document.getElementById("aprice").value;
    		var cntb= document.getElementById("cnt").value;
    		
    		var price="price"+cntb;
    		console.log(price);
    		document.getElementById("oamount_num").value = val;
    		document.getElementById("price").innerHTML = val*apr;
    		console.log(val*apr);
    	}*/
    	$(function(){				
			//개별삭제
			$('.btn_delete_a').on('click', (e) => {
				console.log(e.target.value);
				location.href="CartDeleteOne.do?cno="+(e.target.value)
			});
			
			//주문하기
			$('#order').click(function(){
				var checkbox = $("input[name=chk1]:checked");
				var checkboxVal = $("input[name=chk1]:checked").val();
				var check = new Array();
				
				checkbox.each(function(){
					check.push($(this).val());
				})
				
				if(checkboxVal==null){
					alert("상품을 한 개 이상 선택해주세요.")
				} else{
					location.href = "<%=ctxPath%>/NewOrderList.do?cno=" + check;								
				}				
			});
			
			
			var deli = parseInt($('#delivery').text())
			//커스텀가격
			var custom = 0;
			$('.dselling').each(function(){
				if(!isNaN(this.value)&&this.value.length!=0)
				custom += parseInt($(this).html());
			})
			//상품 갯수+가격 조절
			$('.minus').click(function(){
				var $t = $(this).parents('li');
				var stat = $t.find('input.oamount').val();
				var index = Number($t.find('input.chk2').val());
				stat = stat - 1;
				if(stat<1){
					alert('상품을 한 개 이상 선택해주세요.');
					stat=1;
					}
				var val = stat * $t.find('input.aprice').val();
				$t.find('#price').html(val);
				$t.find('input.oamount').val(stat);
				setTimeout(function(){
					$.ajax({
						type:"get",
						url:"CartUpdate.do",
						data:{
							oamount:stat,
							chk2:index
						}
					});					
				}, 1000);
				var sum =0;
				$('.bbprice').each(function(){
					sum += parseInt($(this).html());
				})
				$('#allselling').html(sum);	
				$('#REALallselling').html(sum+2500);
			});

			$('.plus').click(function(){
				var $t = $(this).parents('li');
				var stat = Number($t.find('input.oamount').val());
				var index = Number($t.find('input.chk2').val());
				stat = stat + 1;
				if(stat<1){
					alert('상품을 한 개 이상 선택해주세요.');
					stat=1;
					}
				var val = stat * $t.find('input.aprice').val();
				$t.find('#price').html(val);
				$t.find('input.oamount').val(stat);
				//alert( "Handler for .change() called." );
				setTimeout(function(){
					$.ajax({
						type:"get",
						url:"CartUpdate.do",
						data:{
							oamount:stat,
							chk2:index
						}
					});					
				}, 1000);
				var sum =0;
				$('.bbprice').each(function(){
					sum += parseInt($(this).html());
				})
				$('#allselling').html(sum+custom);		
				$('#REALallselling').html(sum+custom+deli);
			});
			
			//전체선택
			$(".checkAll").click(function(){
				if($(".checkAll").is(":checked")){
					$(".chk1").prop("checked", true);
					$(".checkAll2").prop("checked", true);
				}
				else{
					$(".chk1").prop("checked", false);
					$(".checkAll2").prop("checked", false);
				}
			});
			$(".checkAll2").click(function(){
				if($(".checkAll2").is(":checked")){
					$(".chk1").prop("checked", true);
					$(".checkAll").prop("checked", true);
				}
				else{
					$(".chk1").prop("checked", false);
					$(".checkAll").prop("checked", false);
				}
			});
			$(".chk1").click(function(){
			    if($("input[name='chk1']:checked")){
			        $(".checkAll").prop("checked", false);
			        $(".checkAll2").prop("checked", false);
			    }
			});
		});


	</script>
</body>

</html>
