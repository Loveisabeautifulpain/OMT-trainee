<div class="col-md-3 sidebar">
    <ul class="list-group">
        <li class="list-group-item">
            <div class="media">
                <a class="pull-left">
                    <img class="media-object" src="
                    <?php
                        // URL ảnh đại diện tài khoản
                        if ($data_user['url_avatar'] == '')
                        {
                            echo $_DOMAIN.'images/profile.png';
                        }
                        else
                        {
                            echo $data_user['url_avatar'];
                        }
                    ?>
                    " alt="Ảnh đại diện của <?php echo $data_user['display_name']; ?>" width="64" height="64">
                </a>
                <div class="media-body">
                    <h4 class="media-heading"><?php echo $data_user['display_name']; ?></h4>
                    <?php
 
                    // Hiển thị cấp bậc tài khoản
                    // Nếu tài khoản là admin
                    if ($data_user['position'] == '1')
                    {
                        echo '<span class="label label-primary">Quản trị viên</span>';
                    }
                    // Ngược lại tài khoản là tác giả
                    else
                    {
                        echo '<span class="label label-success">Tác giả</span>';
                    }
 
                    ?>
                </div>
            </div>
        </li>
        <a class="list-group-item active" href="<?php echo $_DOMAIN; ?>">
            <span class="fa fa-dashboard"></span> Bảng điều khiển
        </a>
        <a class="list-group-item" href="<?php echo $_DOMAIN; ?>profile">
            <span class="fa fa-user"></span> Hồ sơ cá nhân
        </a>
        <a class="list-group-item" href="<?php echo $_DOMAIN; ?>posts">
            <span class="fa fa-edit"></span> Bài viết
        </a>  
        <a class="list-group-item" href="<?php echo $_DOMAIN; ?>photos">
            <span class="fa fa-picture"></span> Hình ảnh
        </a>
        <?php
 
        // Phân quyền sidebar
        // Nếu tài khoản là admin
        if ($data_user['position'] == '1')
        {
            echo
            '
                <a class="list-group-item" href="' . $_DOMAIN . 'categories">
                    <span class="fa fa-tag"></span> Chuyên mục
                </a>
                <a class="list-group-item" href="' . $_DOMAIN . 'setting">
                    <span class="fa fa-cog"></span> Cài đặt chung
                </a>  
            ';
        }
 
        ?>
        <a class="list-group-item" href="<?php echo $_DOMAIN; ?>signout.php">
            <span class="fa fa-off"></span> Thoát
        </a>
    </ul><!-- ul.list-group -->
</div><!-- div.sidebar -->