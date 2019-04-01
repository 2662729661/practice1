
app.controller("arrController", function ($scope, arrService) {

	$scope.entity = {"id1": "", "id2": "", "id3": ""};
	//第一层
	$scope.getArr = function () {
		arrService.getArr(0).success(function (data) {
			$scope.arrList = data;
		});
	};
	
	//第二层
	$scope.$watch("entity.id1", function (newValue) {
		arrService.getArr(newValue).success(function (data) {
			$scope.arrList2 = data;
			$scope.arrList3 = {};
		});
	});

	//第三层
	$scope.$watch("entity.id2", function (newValue) {
		arrService.getArr(newValue).success(function (data) {
			$scope.arrList3 = data;
		});
	});

});