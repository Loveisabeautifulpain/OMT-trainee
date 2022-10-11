<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Newspage Administration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <!-- Liên kết thư viện jQuery -->
    <script src="<?php echo $_ASSET; ?>jquery-3.6.0.min.js"></script>        
 
    <!-- Liên kết Bootstrap CSS -->
    <link rel="stylesheet" href="<?php echo $_ASSET; ?>bootstrap-4.5.3/css/bootstrap.min.css"/> 
    <script src="<?php echo $_ASSET; ?>bootstrap-4.5.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<?php echo $_ASSET; ?>fontawesome/css/all.min.css"/>
    <script src="<?php echo $_ASSET; ?>fontawesome/js/all.min.js"></script>
</head>
<body>
    <?php
 
    // Nếu chưa đăng nhập
    if (!$user)
    {
        echo
        '
            <div class="container">
                <div class="page-header">
                    <h1>Newspage <small>Administration</small></h1>
                </div><!-- div.page-header -->
            </div><!-- div.container -->
        ';
    }
    // Nếu đăng nhập
    else
    {
        echo
        '
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="' . $_DOMAIN . '">Newspage Administration</a>
                    </div><!-- div.navbar-header -->
                </div><!-- div.container-fluid -->
            </nav>
        ';
    }
 
    ?>