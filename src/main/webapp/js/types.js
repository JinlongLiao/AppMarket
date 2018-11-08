var flag = true;
// 执行操作
function addType(srcurl, cwdurl) {
	if (flag) {
		flag = false;
		$.ajax({
			url : srcurl,
			type : 'POST',
			dataType : 'json',
			data : {
				type_name : $('#input').val()
			},
			complete : function(xhr, textStatus) {
				// called when complete

			},
			success : function(data, textStatus, xhr) {
				// called when successful
				if (data.result) {
					alert("添加成功");
					location.href = cwdurl;
				} else {
					alert("添加失败：" + data.desc);
				}
			},
			error : function(xhr, textStatus, errorThrown) {
				// called when there is an error
			}
		});
	} else {
		return;
	}
}

var flag2 = true;
//执行操作
function upDateType(srcurl, cwdurl) {
	console.log($('#myid').text());
	if (flag) {
		flag = false;
		$.ajax({
			url : srcurl,
			type : 'POST',
			dataType : 'json',
			data : {
				id : $('#myid').text(),
				typename : $('#input').val()
			},
			complete : function(xhr, textStatus) {
				// called when complete

			},
			success : function(data, textStatus, xhr) {
				// called when successful
				if (data.result) {
					alert("修改失败成功");
					location.href = cwdurl;
				} else {
					alert("添加失败：" + data);
				}
			},
			error : function(xhr, textStatus, errorThrown) {
				// called when there is an error
			}
		});
	} else {
		return;
	}
}

function doEdit(id, name) {
	// alert(id+name)
	$('#myid').val(id);
	$('#myid').text(id);
	$('input').val(name);
	$('#madd').css('display', 'none');
	$('#madd').attr('disabled', true);
	$('#mupdate').css('display', 'block');
}
