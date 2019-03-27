
app.controller("tableController", function ($scope, tableService) {
	//九九乘法表4
	$scope.multiplication4 = function () {
		tableService.multiplication4().success(function (data) {
			$scope.js = data;
		});
	};
	$scope.i = -90;
	//九九乘法表4
	$scope.mu = function () {
		$scope.i++;
		return $scope.i;
	};
	//test
	$scope.getApi = function () {
		tableService.getApi().success(function (data) {
			$scope.jsApi = data;
		});
	};
	//recordSheet
	$scope.getRecordSheet = function () {
		tableService.getRecordSheet().success(function (data) {
			$scope.recordSheet = data;
		});
	};
});


