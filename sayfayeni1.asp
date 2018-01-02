<%
if session("sayfahit-"&rs("id")&"")<>"evet" then
 rs("hit")=rs("hit")+1
 session("sayfahit-"&rs("id")&"")="evet"
 rs.update
end if
%>
<div class="container">
	<%if 1>2 then%>
    <ol class="breadcrumb">
        <li><a href="<%=siteurl%>">Ana Sayfa</a></li>
        <li><span class="kucukharf"><%=rs("askodu")%></li>
        <li class="active"><%=rs("adi")%></li>
    </ol>
	<%end if%>
	<div class="syfgnl">
        <div class="row">
            <div class="col-md-12">
                <article class="post">
                    <h1 class="entry-title" itemprop="name"><%=rs("adi")%></h1>
                    <div class="inline20"></div>
                    <div class="entry-content">
						<%=rs("detay")%>
					</div>
                </article>
				<div align="right" style="margin-top:2px;"> Gösterim Sayısı : <strong><%=rs("hit")%></strong></div>
            </div>
        </div>
    </div>
</div>
