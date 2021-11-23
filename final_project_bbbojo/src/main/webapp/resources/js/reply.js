/**
 * reply.js
 * 댓글 구현. 클로저를 이용한 모듈
 */
console.log("reply module")

var replyService = (function(){ 
  function add(reply, callback, error) {
      console.log("reply.add()");
      console.log(reply);
      $.ajax({
        type : "post",
        url : "/replies/new",
        data : JSON.stringify(reply),
        contentType : "application/json; charset=utf-8",
        success : function(data) {
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
  function add2(reply, callback, error) {
	  console.log("reply.add2()");
	  console.log(reply);
	  $.ajax({
		  type : "post",
		  url : "/replies/new2",
		  data : JSON.stringify(reply),
		  contentType : "application/json; charset=utf-8",
		  success : function(data) {
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

  function getList(param, callback, error){
      console.log("reply.getList()");
      var bno = param.bno; // 고정값
      var amount = param.amount || 10 ;
      var lastRno = param.lastRno || 0;
      var url = '/replies/' + bno + "/" + amount + "/" + lastRno;

      $.getJSON(url, function(data) {
        callback(data);
      });
  }

  function remove(rno, callback, error) {
    var url ='/replies/' + rno;
      console.log("reply.remove()");
      
      $.ajax(url, {
        type : "delete",
      }).done(function(data) {
        if(callback)
          callback(data);
      })
    }
  function modify(reply, callback, error) {
    var url ='/replies/' + reply.rno;
    console.log("reply.modify()");

    $.ajax(url, {
      type : "put",
      data : JSON.stringify(reply),
      contentType : "application/json; charset=utf-8",
      success : function(data) {
        if(callback)
        callback(data);
      }
    })
  }

  function get(rno, callback, error) {
    console.log("reply.get()");
    var url ='/replies/' + rno;
    $.getJSON(url, function(data) {
      if(callback)
      callback(data);
    });
  }
  function getLike(bno, callback, error) {
	  console.log("reply.getLike()");
	  var url ='/board/likeCount/' + bno;
	  $.getJSON(url, function(data) {
		  if(callback)
			  callback(data);
	  });
  }

  function displayTime(timeValue) {
    return moment().diff(moment(timeValue), 'days') < 1 ? moment(timeValue).format('HH:mm:ss') : moment(timeValue).format('YY/MM/DD');
  }

  return {
    add:add,
    add2:add2,
    getList:getList,
    remove:remove,
    modify:modify,
    get:get,
    displayTime:displayTime,
    getLike:getLike
  }
 })();