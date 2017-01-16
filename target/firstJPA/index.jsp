<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<html>
<body>
<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    新增
</button>
<table class="table table-bordered">
    <tr class="active">
        <td>Id</td>
        <td>名称</td>
        <td>价格</td>
        <td>作者</td>
        <td>操作</td>
    </tr>
    <c:forEach var="book" items="${bookList }">
        <tr>
            <td>${book.id}</td>
            <td>${book.name}</td>
            <td>${book.price}</td>
            <td>${book.author}</td>
            <td>
                <button type="button" class="btn btn-info active"  onclick="openBook('${book.id}','${book.name}','${book.price}','${book.author}')" >修改</button>
                <button type="button" class="btn btn-info active"  onclick="deleteBook(${book.id})">删除</button>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增
                </h4>
            </div>

            <form action="book/addBook" method="post" id="bookForm" name="bookForm">
                <div class="modal-body">
                    <table>
                        <tr>
                            <td>名称</td>
                            <td><input type="text" value="aaa" name="name" id="name"></td>
                        </tr>
                        <tr>
                            <td>价格</td>
                            <td><input type="text" value="price" name="price" id="price"></td>
                        </tr>
                        <tr>
                            <td>作者</td>
                            <td><input type="text" value="author" name="author" id="author"></td>
                        </tr>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addBook() ">
                                    保存
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>

            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="update_myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    新增
                </h4>
            </div>

            <form action="book/addBook" method="post" id="bookForm2" name="bookForm2">
                <div class="modal-body">
                    <table>
                        <input type="hidden"  name="update_id" id="update_id">
                        <tr>
                            <td>名称</td>
                            <td><input type="text" value="aaa" name="update_name" id="update_name"></td>
                        </tr>
                        <tr>
                            <td>价格</td>
                            <td><input type="text" value="price" name="update_price" id="update_price"></td>
                        </tr>
                        <tr>
                            <td>作者</td>
                            <td><input type="text" value="author" name="update_author" id="update_author"></td>
                        </tr>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateBook() ">
                                    保存
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>

            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    function addBook() {
        var name = $("#name").val();
        var price = $("#price").val();
        var author = $("#author").val();

        $.post("${pageContext.request.contextPath}/conBook/addBook",
            {
                name: name,
                price: price,
                author: author
            },
            function (result) {
                if (result.rs == 'success') {
                    alert("成功");
                    javascript:location.reload();
                }
            }
        );
    }
    function openBook(id,name,price,author) {
        $("#update_id").val(id);
        $("#update_name").val(name);
        $("#update_price").val(price);
        $("#update_author").val(author);
        $("#update_myModal").modal("toggle");

    }
    function updateBook() {
        var id = $("#update_id").val();
        var name = $("#update_name").val();
        var price = $("#update_price").val();
        var author = $("#update_author").val();
        $.post("${pageContext.request.contextPath}/conBook/updateBook",
            {
                id:id,
                name: name,
                price: price,
                author: author
            },
            function (result) {
                if (result.rs == 'success') {
                    alert("成功");
                    javascript:location.reload();
                }
            }
        );
    }
    function deleteBook(id) {
        $.get("${pageContext.request.contextPath}/conBook/deleteBook?id=" + id,
            function (rs) {
                if (rs == 'success') {
                    javascript:location.reload();
                }
            });
    }
</script>
</body>
</html>
