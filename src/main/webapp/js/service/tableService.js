
app.service("tableService", function ($http) {
	//3
        this.multiplication4 = function () {
                return $http.get("multiplication4");
        };
	//test
	this.getApi = function () {
                return $http.get("apiJs");
        };
	//recordSheet
	this.getRecordSheet = function () {
                return $http.get("recordSheet");
        };

});


