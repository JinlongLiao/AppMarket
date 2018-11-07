var flag = true;
// 执行操作
function addType(srcurl,cwdurl) {
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
