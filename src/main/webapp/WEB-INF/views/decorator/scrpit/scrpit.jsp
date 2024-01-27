<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 17/1/2024
  Time: 6:57 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/js/jquery-3.3.1.min.js" type="application/javascript"></script>
<script src="/js/bootstrap.bundle.min.js" type="application/javascript"></script>
<script src="/js/owl.carousel.min.js" type="application/javascript"></script>
<script src="/js/jquery.mousewheel.min.js" type="application/javascript"></script>
<script src="/js/jquery.mCustomScrollbar.min.js" type="application/javascript"></script>
<script src="/js/wNumb.js" type="application/javascript"></script>
<script src="/js/nouislider.min.js" type="application/javascript"></script>
<script src="/js/plyr.min.js" type="application/javascript"></script>
<script src="/js/jquery.morelines.min.js" type="application/javascript"></script>
<script src="/js/photoswipe.min.js" type="application/javascript"></script>
<script src="/js/photoswipe-ui-default.min.js" type="application/javascript"></script>
<script src="/js/main.js" type="application/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.3/angular.min.js" integrity="sha512-KZmyTq3PLx9EZl0RHShHQuXtrvdJ+m35tuOiwlcZfs/rE7NZv29ygNA8SFCkMXTnYZQK2OX0Gm2qKGfvWEtRXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    let myApp = angular.module("category",[]);
    myApp.controller('categoryController', function($scope, $http) {
        // Gọi API
        $http.get('http://localhost:8080/api/v1/category-api/get-all-category')
            .then(function(response) {
                $scope.responseData = response.data;
                console.log(response)
            })
            .catch(function(error) {
                // Xử lý lỗi
                console.error('Error:', error);
            });
    });
    myApp.controller('searchingController',($scope)=>{
        $scope
    })
</script>