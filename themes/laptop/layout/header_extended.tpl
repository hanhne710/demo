    <noscript>
        <div class="alert alert-danger">{LANG.nojs}</div>
    </noscript>
    <header>
        <div class="section-header">
            <div class="wraper">
                <div id="header">
                    <div class="logo">
                        <a title="{SITE_NAME}" href="{THEME_SITE_HREF}"><img src="{LOGO_SRC}" alt="{SITE_NAME}"></a>
                        <!-- BEGIN: site_name_h1 -->
                        <h1>{SITE_NAME}</h1>
                        <!-- END: site_name_h1 -->
                        <!-- BEGIN: site_name_span -->
                        <span class="site_name">{SITE_NAME}</span>
                        <!-- END: site_name_span -->
                    </div>
                    <div class="header-search">
                        <form action="{NV_BASE_SITEURL}index.php" method="get" role="form">
                            <input type="hidden" name="language" value="vi">
                            <input type="hidden" name="nv" value="san-pham">
                            <input type="hidden" name="op" value="search">
                            <div class="d-flex input-group">
                                <input type="text" name="q" class="form-control" placeholder="Từ khóa...">
                                <div class="input-group-append">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="header-right">
                        <ul class="d-flex">
                             <li><a href="https://bit.ly/3HEjGpP" title="Số 75 đường 2/4, Vĩnh Hòa, Nha Trang, Khánh Hòa" style="font-weight: bold;">Số 75 đường 2/4, Vĩnh Hòa <br>NNha Trang, Khánh Hòa</a></li>
                            <li><a href="/blog/" title="Blog tin tức">Blog<br>Tin tức</a></li>
                            [HEADER_CART]
                            <li><a href="tel:0796.889.883" title="Gọi mua hàng" class="d-flex">
                                    <span><i class="fa fa-phone"></i></span>
                                    <span>
                                        <small>Gọi mua hàng</small>
                                        <br>
                                        <strong>0796.889.883</strong>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <nav class="second-nav" id="menusite">
            <div class="wraper">
                <div class="row">
                    <div class="col-md-5">
                        <div class="btn-show-cates">
                            <a href="/tat-ca-san-pham/" onmouseover="toggleClassMenuCatesHeader({IS_HOME});return false;" onmouseleave="toggleClassMenuCatesHeader({IS_HOME}, 1);return false;"><em class="fa fa-list"></em> DANH MỤC SẢN PHẨM</a>
                            <div id="box-cates-with-btn">
                                [HOME_CATEGORIES]
                            </div>
                        </div>
                    </div>
                    <div class="col-md-19">
                        [MENU_SITE]
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <!-- <div class="h-header" style="width: 100%;height: var(--height-header);"></div> -->
    <!-- BEGIN: breadcrumbs -->
    <div class="box-breadcrumbs">
        <div class="wraper">
            <div class="breadcrumbs-wrap">
                <div class="display">
                    <a class="show-subs-breadcrumbs hidden" href="#" onclick="showSubBreadcrumbs(this, event);"><em
                            class="fa fa-lg fa-angle-right"></em></a>
                    <ul class="breadcrumbs list-none"></ul>
                </div>
                <ul class="subs-breadcrumbs"></ul>
                <ul class="temp-breadcrumbs hidden" itemscope itemtype="https://schema.org/BreadcrumbList">
                    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a
                            href="{THEME_SITE_HREF}" itemprop="item" title="{LANG.Home}"><span
                                itemprop="name">{LANG.Home}</span></a><i class="hidden" itemprop="position"
                            content="1"></i></li>
                    <!-- BEGIN: loop -->
                    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a
                            href="{BREADCRUMBS.link}" itemprop="item" title="{BREADCRUMBS.title}"><span class="txt"
                                itemprop="name">{BREADCRUMBS.title}</span></a><i class="hidden" itemprop="position"
                            content="{BREADCRUMBS.position}"></i></li><!-- END: loop -->
                </ul>
            </div>
        </div>
    </div>

    <!-- END: breadcrumbs -->


[THEME_ERROR_INFO]