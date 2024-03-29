<!-- BEGIN: main -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset={CHARSET}" />
    <meta http-equiv="expires" content="0" />
    <meta name="resource-type" content="document" />
    <meta name="distribution" content="global" />
    <meta name="copyright" content="Copyright (c) {SITE_NAME}" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width">
    <title>{SITE_NAME} {NV_TITLEBAR_DEFIS} {GLANG.admin_page}</title>
    <link rel="shortcut icon" href="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/images/favicon.ico">
    <link rel="stylesheet" href="{NV_BASE_SITEURL}themes/default/css/bootstrap.min.css">
    <link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/css/font-awesome.min.css">
    <link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/css/style.css">
    <link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/css/login.css" />
    <script type="text/javascript">
        var jsi = new Array('{SITELANG}', '{NV_BASE_SITEURL}', '{CHECK_SC}', '{GFX_NUM}');
        var login_error_security = '{LOGIN_ERROR_SECURITY}';
        var nv_cookie_prefix = '{NV_COOKIE_PREFIX}';
    </script>
    <script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/global.js"></script>
    <script type="text/javascript" src="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/js/login.js"></script>
</head>

<body>
    <div id="wrapper">
        <div id="dm-info">
            <h1 class="admincp-title">
                <img src="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/images/logo.png" alt="Logo VUTA" style="margin-bottom: 15px;">
                <br>
                {ADMIN_LOGIN_TITLE}
            </h1>
            <hr>

            <h2><strong>HỖ TRỢ KỸ THUẬT</strong></h2>
            <p>
            <h3><strong>Hotline:</strong> <a href="tel:0796889883">0796.889.883</a></h3>
            <h3><strong>Email:</strong> <a href="mailto:hotro@vuta.vn">hotro@vuta.vn</a></h3>
            </p>
            <hr>
            <p class="text-center">
            <h3>Phát triển và vận hành bởi</h3>
            <h2 style="font-size: 22px;"><strong>CÔNG TY TNHH VUTA VIỆT NAM</strong></h2>
            <strong>Website:</strong>
            <a href="https://vuta.vn/" target="_blank">
                vuta.vn
            </a>
            -
            <strong>Email:</strong>
            <a href="mailto:hi@vuta.vn">hi@vuta.vn</a>
            -
            <strong>Hotline:</strong>
            <a href="tel:0796889883">0796.889.883</a>
            </p>
        </div>
        <div id="login-content">
            <!-- BEGIN: logo -->
            <div id="logo">
                <a title="{SITE_NAME}" href="{NV_BASE_SITEURL}"><img src="{LOGO}" class="img-responsive" alt="{SITE_NAME}" /></a>
            </div>
            <!-- END: logo -->
            
            <div class="inner-message">
                <!-- BEGIN: info -->
                <div class="normal">{GLANG.adminlogininfo}</div><!-- END: info -->
                <!-- BEGIN: error -->
                <div class="error">{ERROR}</div><!-- END: error -->
            </div>
            <form class="loginform form-horizontal" method="post" action="{NV_BASE_ADMINURL}index.php" id="admin-login-form">
                <!-- BEGIN: pre_form -->
                <div class="loginStep1">
                    <!-- BEGIN: lang_multi -->
                    <p class="muti-lang form-inline">
                        <label for="langinterface">{LANGTITLE}:</label>
                        <select id="langinterface" name="langinterface" onchange="top.location.href=this.options[this.selectedIndex].value;" class="form-control input-sm">
                            <!-- BEGIN: option -->
                            <option value="{LANGOP}" {SELECTED}>{LANGVALUE} </option>
                            <!-- END: option -->
                        </select>
                    </p>
                    <!-- END: lang_multi -->
                    <p>
                        <label for="nv_login">{GLANG.username}:</label>
                        <input class="form-control" name="nv_login" type="text" id="nv_login" value="{V_LOGIN}" />
                    </p>
                    <p>
                        <label for="nv_password">{GLANG.password}:</label>
                        <input autocomplete="off" class="form-control" name="nv_password" type="password" id="nv_password" value="{V_PASSWORD}" />
                    </p>
                    <!-- BEGIN: captcha -->
                    <p>
                        <label for="nv_seccode">{N_CAPTCHA}:</label>
                    <div class="row">
                        <div class="col-xs-10">
                            <input name="nv_seccode" type="text" id="seccode" maxlength="{GFX_NUM}" class="form-control captcha" />
                        </div>
                        <div class="col-xs-11">
                            <img id="vimg" alt="{N_CAPTCHA}" src="{NV_BASE_SITEURL}index.php?scaptcha=captcha&t={NV_CURRENTTIME}" width="{GFX_WIDTH}" height="{GFX_HEIGHT}" />
                        </div>
                        <div class="col-xs-3">
                            <em class="fa fa-refresh fa-lg icon-pointer" onclick="nv_change_captcha();">&nbsp;</em>
                        </div>
                    </div>
                    </p>
                    <!-- END: captcha -->
                    <!-- BEGIN: recaptcha -->
                    <div class="m-bottom">
                        <label>{N_CAPTCHA}:</label>
                        <div id="reCaptcha"></div>
                        <script src="https://www.google.com/recaptcha/api.js?hl={SITELANG}&onload=onloadCallback&render=explicit"></script>
                        <script type="text/javascript">
                            var onloadCallback = function() {
                                $('[type="submit"]').prop('disabled', true);
                                grecaptcha.render('reCaptcha', {
                                    'sitekey': '{RECAPTCHA_SITEKEY}',
                                    'type': '{RECAPTCHA_TYPE}',
                                    'callback': function(res) {
                                        $('[type="submit"]').prop('disabled', false);
                                    }
                                });
                            };
                        </script>
                    </div>
                    <!-- END: recaptcha -->
                    <div id="smb">
                        <input type="hidden" name="checkss" value="{NV_CHECK_SESSION}">
                        <input class="btn btn-primary" type="submit" value="{GLANG.loginsubmit}">
                    </div>
                    <p class="lostpass">
                        <a title="{LANGLOSTPASS}" href="{LINKLOSTPASS}">{LANGLOSTPASS}?</a>
                    </p>
                </div>
                <!-- END: pre_form -->

                <!-- BEGIN: 2step_form -->
                <div class="loginStep2">
                    <p>{ADMIN_2STEP_HELLO}.</p>
                    <!-- BEGIN: must_activate -->
                    <p class="text-danger">{GLANG.admin_mactive_2step}. {LANG_CHOOSE}:</p>
                    <!-- BEGIN: loop -->
                    <a href="{BTN.link}" class="btn btn-block m-bottom btn-info btn-{BTN.key}">{BTN.title}</a>
                    <!-- END: loop -->
                    <!-- END: must_activate -->

                    <!-- BEGIN: choose_method -->
                    {HTML_DEFAULT}
                    <!-- BEGIN: others -->
                    <p class="login-2step-others"><strong>{GLANG.admin_2step_other}:</strong></p>
                    {HTML_OTHER}
                    <!-- END: others -->
                    <!-- END: choose_method -->

                    <div class="text-right">
                        <a href="{ADMIN_PRE_LOGOUT}"><i>{GLANG.admin_pre_logout}</i></a>.
                        <div>
                        </div>
                        <!-- END: 2step_form -->
            </form>
            <hr>
            <div id="copyright">
                <p>Copyright &copy; <a href="{SITEURL}">{SITE_NAME}</a>. All rights reserved.</p>
            </div>
        </div>
    </div>
</body>

</html>
<!-- END: main -->

<!-- BEGIN: code -->
<div class="stepipt{SHOW_TOTPPIN}">
    <label>{GLANG.2teplogin_totppin_label}</label>
    <input type="text" class="form-control" placeholder="{GLANG.2teplogin_totppin_placeholder}" value="" name="nv_totppin" id="nv_totppin" maxlength="6" autocomplete="off">
    <div class="text-center">
        <a href="#" onclick="return login2step_change(this);">{GLANG.2teplogin_other_menthod}</a>
    </div>
</div>
<div class="stepipt{SHOW_BACKUPCODEPIN}">
    <label>{GLANG.2teplogin_code_label}</label>
    <input type="text" class="form-control" placeholder="{GLANG.2teplogin_code_placeholder}" value="" name="nv_backupcodepin" id="nv_backupcodepin" maxlength="8" autocomplete="off">
    <div class="text-center">
        <a href="#" onclick="return login2step_change(this);">{GLANG.2teplogin_other_menthod}</a>
    </div>
</div>
<div id="smb2step">
    <input type="hidden" name="checkss" value="{NV_CHECK_SESSION}">
    <input class="btn btn-primary" type="submit" name="submit2scode" value="{GLANG.confirm}">
</div>
<!-- END: code -->

<!-- BEGIN: facebook -->
<div class="oauth-facebook m-bottom">
    <a class="btn btn-facebook btn-block" href="{URL}">{GLANG.admin_2step_opt_facebook}</a>
</div>
<!-- END: facebook -->

<!-- BEGIN: google -->
<div class="oauth-google m-bottom">
    <a class="btn btn-google btn-block" href="{URL}">{GLANG.admin_2step_opt_google}</a>
</div>
<!-- END: google -->