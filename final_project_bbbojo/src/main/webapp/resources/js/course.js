/**
 * course.js
 * 수강신청
 */

console.log("enrollclass module");

var enrollclassService = (function() {
    function add(enrollclass, callback, error) {
        console.log("enrollclass.add()");

        $.ajax({
            type: "post",
            url: "/enrollclass/new",
            data: JSON.stringify(enrollclass),
            contentType: "application/json; charset=utf-8",
            success: function(data) {
                if(callback)
                callback(data);
            },
            error : function(xhr, stat, er) {
                if(error) {
                    error(er);
                }
            }
        }).fail(function(xhr, stat, er) {
			alert("중복신청 불가능")
		})
    }
    
    function remove(enrollclass, callback, error) {
    	console.log("enrollclass.remove()");
    	var courno = enrollclass.courno;
    	var studno = enrollclass.studno;
    	var url = '/enrollclass/'+courno+'/'+studno;
    	$.ajax(url, {
    		type: "delete"
    	}).done(function(data) {
    		if(callback)
    		callback(data)
    	})
    }
    
    function get(enrollclass, callback, error) {
    	console.log("enrollclass.get()");
    	var url = '/enrollclass/'+enrollclass.courno+'/'+enrollclass.studno;
    	$.getJSON(url, function(data){
    		if(callback)
    		callback(data);
    	})
    }
    
    
    return {
    	add : add,
    	remove : remove,
    	get : get
    }
})();


var creditService = (function() {
	function add(enrollclass, callback, error) {
		console.log("credit.add()");
		
		$.ajax({
			type: "post",
			url: "/credit/new",
			data: JSON.stringify(enrollclass),
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				if(callback)
					callback(data);
			},
			error : function(xhr, stat, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function remove(enrollclass, callback, error) {
		console.log("enrollclass.remove()");
		var courno = enrollclass.courno;
		var url = '/enrollclass/'+courno+'/'+studno;
		$.ajax(url, {
			type: "delete"
		}).done(function(data) {
			if(callback)
				callback(data)
		})
	}
	
	function get(studno, callback, error) {
		console.log("credit.get()");
		var url = '/credit/get/'+studno;
		$.getJSON(url, function(data){
			if(callback)
				callback(data);
		})
	}
	
	return {
		add : add,
		remove : remove,
		get : get
	}
})();



var courseService = (function() {
	function get(courno, callback, error) {
		var url = "/course/" + courno;
		$.getJSON(url, function(data) {
			if(callback)
			callback(data);
		})
	}
	
    function getList2(studno, callback, error) {
    	console.log("course.getList()");
    	//console.log(studno);
    	var url = '/course/list/' + studno;
    	//console.log(url);
    	$.getJSON(url, function(data) {
    		if(callback)
    		callback(data);
    		//console.log(data);
    	});
    }
    
    function getOverlap(course, callback, error) {
    	console.log("courseService.getOverlap()");
    	var studno = course.studno;
    	var day = course.day;
    	var url = '/course/' + studno + '/' + day;
    	$.getJSON(url, function(data) {
    		if(callback)
    		callback(data);
    	})
    }
	
	return {
		get: get,
		getList2: getList2,
		getOverlap: getOverlap
	}
})();

var timeTableService = (function() {
	
	function savedata(jsondata, callback, error) {
	console.log("timeTableService.savedata()");
	$.ajax({
		type: "post",
		url: "/timeTable/new",
		data: JSON.stringify(jsondata),
		contentType: "application/json; charset=utf-8",
        success: function(jsondata) {
            if(callback)
            callback(data);
        },
        error : function(xhr, stat, er) {
            if(error) {
                error(er);
            }
        }
	})
	}
	
	function removeall(studno, callback, error) {
	var url ="/timeTable/remove/" + studno;
	console.log("timeTableService.removeall()");
	    $.ajax(url, {
	        type : "delete",
	    }).done(function(data) {
	        if(callback)
	        callback(data);
	    })
	}
	
	function loadingEvents(studno, callback, error) {
		console.log("timeTableService.loadingEvents()");
		var url = "/timeTable/"+ studno;
		
		
		$.ajax({
			type: "get",
			url: "/timeTable/" + studno,
			data: {},
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
			success: function(data) {
				if(callback)
				callback(data);
			},
		})
		.done(function(result){
//		console.log(result);
		})
	}
    function remove(arg, callback, error) {
    	var id = arg.event._def.publicId
        var url = "/timeTable/" + id;
        console.log("timeTable.remove()");


        $.ajax(url, {
            type : "delete",
        }).done(function(data) {
            if(callback)
            callback(data);
        })
    }
	
	return{
		savedata: savedata,
		loadingEvents:loadingEvents,
		remove:remove,
		removeall:removeall
	}
	
})();

var subjectService = (function() {
	function add(subject, callback, error) {
        console.log("subject.add()");
        console.log(subject);
        $.ajax({
            type: "post",
            url: "/adminCourse/new",
            data: JSON.stringify(subject),
            contentType: "application/json; charset=utf-8",
            success: function(data) {
                if(callback)
                callback(data);
            },
            error : function(xhr, stat, er) {
                if(error) {
                    error(er);
                }
            }
        })
    }
	
	function remove(subno, callback, error) {
		console.log("subject.remove()");
		var url = '/adminCourse/'+subno;
		$.ajax(url, {
			type: "delete"
		}).done(function(data) {
			if(callback)
				callback(data)
		})
	}
	
	return {
		add: add,
		remove: remove
	}
})();