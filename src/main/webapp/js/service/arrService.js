
app.service("arrService", function ($http) {
	//arr
	this.getArr = function (nid) {
                return $http.get("getArr?nid="+nid);
        };

});