<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/18
  Time: 7:45 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<style type="text/css">
		.body-footer {
			clear:both;
			font-size:80%;
			line-height:22px;
			margin-bottom:50px;
			margin-top:50px;
			text-align:center;
			font-family:"Microsoft Yahei";
		}
	</style>
	<script type="text/javascript">

		$(function () {


			var severtime = new Date($.ajax({async: false}).getResponseHeader("Date"));
			var year=severtime.getFullYear();
			var month=severtime.getMonth()+1;
			var date=severtime.getDate();
			var hour=severtime.getHours();
			var minu=severtime.getMinutes();
			var seco=severtime.getSeconds();

			function getSeverTime(){
				seco++;
				if(seco==60){
					minu+=1;
					seco=0;
				}
				if(minu==60){
					hour+=1;
					minu=0;
				}
				if(hour==24){
					date+=1;
					hour=0;
				}
				if(month==1||month==3||month==5||month==7
						||month==8||month==10||month==12)
				{
					if(date==32)
					{
						date=1;
						month+=1;
					}
				}else if(month==4||month==6||month==9||month==11){
					if(date==31){
						date=1;
						month+=1;
					}
				}else if(month==2){
					if(year%4==0&&year%100!=0){
						if(date==29){
							date=1;
							month+=1;
						}
					}else{
						if(date==28){
							date=1;
							month+=1;
						}
					}
				}
				if(month==13){
					year+=1;
					month=1;
				}
				sseco=addZero(seco);
				sminu=addZero(minu);
				shour=addZero(hour);
				sdate=addZero(date);
				smonth=addZero(month);
				syear=year;
				document.getElementById("servertime").innerHTML =syear+"-"+smonth+"-"+sdate+" "+shour+":"+sminu+":"+sseco;
				//console.log(innerdata+syear+"-"+smonth+"-"+sdate+" "+shour+":"+sminu+":"+sseco);
			}

			function addZero(num) {
				num=Math.floor(num);
				return ((num <= 9) ? ("0" + num) : num);
			}

			var repeat = setInterval(getSeverTime,1000);

		})
	</script>
<div class="body-footer">
	All Copyright Reserved © 2022<br/>
	Server Time: <span id="servertime"></span>
</div>