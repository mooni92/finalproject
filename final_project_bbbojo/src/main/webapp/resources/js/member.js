/**
 * course.js
 * 수강신청
 */
console.log("enrollclass module");


var memberService = (function() {
    function get(phoneNumber, callback, error) {
    	console.log("memberService.get()");
    	var url = '/member/'+ phoneNumber;
    	
    	$.getJSON(url, function(data){
    		if(callback)
    		callback(data);
    	})
    }
    
    return {
    	get : get
    }
})();


