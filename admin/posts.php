<?php
 
// Kết nối database và thông tin chung
require_once 'core/init.php';
 
// Nếu đăng nhập
if ($user) 
{
    // Nếu tồn tại POST action
    if (isset($_POST['action']))
    {
        // Xử lý POST action
        $action = trim(addslashes(htmlspecialchars($_POST['action'])));
 
        // Thêm bài viết
        if ($action == 'add_post')
        {
            // Xử lý các giá trị
            $title_add_post = trim(addslashes(htmlspecialchars($_POST['title_add_post'])));
            $slug_add_post = trim(addslashes(htmlspecialchars($_POST['slug_add_post'])));
 
            // Các biến xử lý thông báo
            $show_alert = '<script>$("#formAddPost .alert").removeClass("hidden");</script>';
            $hide_alert = '<script>$("#formAddPost .alert").addClass("hidden");</script>';
            $success = '<script>$("#formAddPost .alert").attr("class", "alert alert-success");</script>';
 
            // Nếu các giá trị rỗng
            if ($title_add_post == '' || $slug_add_post == '')
            {
                echo $show_alert.'Vui lòng điền đầy đủ thông tin';
            }
            // Ngược lại
            else
            {
                // Kiểm tra bài viết tồn tại 
                $sql_check_post_exist = "SELECT title, slug FROM posts WHERE title = '$title_add_post' OR slug = '$slug_add_post'";
                // Nếu bài viết tồn tại
                if ($db->num_rows($sql_check_post_exist))
                {
                    echo $show_alert.'Bài viết có tiêu đề hoặc slug đã tồn tại.';
                }
                else
                {
                    // Thực thi thêm bài viết
                    $sql_add_post = "INSERT INTO posts VALUES (
                        '',
                        '$title_add_post',
                        '',
                        '',
                        '$slug_add_post',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '$data_user[id_acc]',
                        '0',
                        '0',
                        '$date_current'
                    )";
                    $db->query($sql_add_post);
                    echo $show_alert.$success.'Thêm bài viết thành công.';
                    $db->close(); // Giải phóng
                    new Redirect($_DOMAIN.'posts'); // Trở về trang danh sách bài viết
                }
            }
        }
 
        // Tải chuyên mục trong chỉnh sửa bài viết
        // Chuyên mục vừa
else if ($action == 'load_cate_2')
{
    $parent_id = trim(htmlspecialchars(addslashes($_POST['parent_id'])));
 
    $sql_get_cate_2 = "SELECT id_cate, label FROM categories WHERE type = '2' AND parent_id = '$parent_id'";
    if ($db->num_rows($sql_get_cate_2)) {
        foreach ($db->fetch_assoc($sql_get_cate_2, 0) as $key => $data_cate_2) {
            echo '<option value="' . $data_cate_2['id_cate'] . '">' . $data_cate_2['label'] . '</option>';
        }
    } else {
        echo '<option value="">Chưa có chuyên mục vừa nào</option>';
    }
}

 
// Chỉnh sửa bài viết
else if ($action == 'edit_post')
{
    // Xử lý các giá trị
    $id_post = trim(htmlspecialchars(addslashes($_POST['id_post'])));
    $stt_edit_post = trim(htmlspecialchars(addslashes($_POST['stt_edit_post'])));
    $title_edit_post = trim(htmlspecialchars(addslashes($_POST['title_edit_post'])));
    $slug_edit_post = trim(htmlspecialchars(addslashes($_POST['slug_edit_post'])));
    $url_thumb_edit_post = trim(htmlspecialchars(addslashes($_POST['url_thumb_edit_post'])));
    $desc_edit_post = trim(htmlspecialchars(addslashes($_POST['desc_edit_post'])));
    $keywords_edit_post = trim(htmlspecialchars(addslashes($_POST['keywords_edit_post'])));
    $cate_1_edit_post = trim(htmlspecialchars(addslashes($_POST['cate_1_edit_post'])));
    $cate_2_edit_post = trim(htmlspecialchars(addslashes($_POST['cate_2_edit_post'])));
    $body_edit_post = trim(htmlspecialchars(addslashes($_POST['body_edit_post'])));
 
    // Các biến xử lý thông báo
    $show_alert = '<script>$("#formEditPost .alert").removeClass("hidden");</script>';
    $hide_alert = '<script>$("#formEditPost .alert").addClass("hidden");</script>';
    $success = '<script>$("#formEditPost .alert").attr("class", "alert alert-success");</script>';
 
    // Kiểm tra id bài viết
    $sql_check_id_post = "SELECT id_post FROM posts WHERE id_post = '$id_post'";
 
    // Nếu các giá trị rỗng
    if ($stt_edit_post == '' || $title_edit_post == '' || $slug_edit_post == '' || $cate_1_edit_post == '' || $body_edit_post == '') 
    {
        echo $show_alert.'Vui lòng điền đầy đủ thông tin.';
    } 
    else if (!$db->num_rows($sql_check_id_post))
    {
        echo $show_alert.'Đã có lỗi xảy ra, vui lòng thử lại.';
    }
    // Kiểm tra url ảnh
    else if ($url_thumb_edit_post != '' && filter_var($url_thumb_edit_post, FILTER_VALIDATE_URL) === false)
    {
        echo $show_alert.'Vui lòng nhập url thumbnail hợp lệ.';
    }
    else
    {
        // Sửa bài viết
        $sql_edit_post = "UPDATE posts SET
            status = '$stt_edit_post',
            title = '$title_edit_post',
            slug = '$slug_edit_post',
            url_thumb = '$url_thumb_edit_post',
            descr = '$desc_edit_post',
            keywords = '$keywords_edit_post',
            cate_1_id = '$cate_1_edit_post',
            cate_2_id = '$cate_2_edit_post',
            body = '$body_edit_post'
            WHERE id_post = '$id_post';
        ";
        $db->query($sql_edit_post);
        $db->close();
        echo $show_alert.$success.'Chỉnh sửa bài viết thành công.';
        new Redirect($_DOMAIN.'posts');
    }
}
 
// Xoá bài viết
    // Xoá nhiều bài viết cùng lúc
else if ($action == 'delete_post_list')
{
    foreach ($_POST['id_post'] as $key => $id_post)
    {
        $sql_check_id_post_exist = "SELECT id_post FROM posts WHERE id_post = '$id_post'";
        if ($db->num_rows($sql_check_id_post_exist))
        {
            $sql_delete_post = "DELETE FROM posts WHERE id_post = '$id_post'";
            $db->query($sql_delete_post);
        }
    }   
    $db->close();
}
// Xoá 1 chuyên mục
else if ($action == 'delete_post')
{       
    $id_post = trim(htmlspecialchars(addslashes($_POST['id_post'])));
    $sql_check_id_post_exist = "SELECT id_post FROM posts WHERE id_post = '$id_post'";
    if ($db->num_rows($sql_check_id_post_exist))
    {
        $sql_delete_post = "DELETE FROM posts WHERE id_post = '$id_post'";
        $db->query($sql_delete_post);
        $db->close();
    }       
}
    }
    // Ngược lại không tồn tại POST action
    else
    {
        new Redirect($_DOMAIN);
    }
}
// Nếu không đăng nhập
else
{
    new Redirect($_DOMAIN);
}
 
?>