<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_extended.tpl"}

<section class="hero-home">
    <div class="wraper">
        <div class="row">
            <div class="col-md-5">
                [HOME_CATEGORIES]
            </div>
            <div class="col-md-19">
                <div class="row">
                    <div class="col-md-16">
                        [HOME_SLIDER]
                    </div>
                    <div class="col-md-8">
                        [ADS_RIGHT_SLIDER]
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="site-banner d-hone hide">
    <img src="{BANNER_SRC}" alt="Ảnh banner trang chủ">
</div>

<div class="wraper">
    [HEADER]

    <div class="row features">
        <div class="col-xs-12 col-md-6">
            <div class="feature-item">
                <img src="/uploads/features/1.png" alt="Sản phẩm uy tín">
                <span>Sản phẩm uy tín</span>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="feature-item">
                <img src="/uploads/features/2.png" alt="Cam kết chất lượng">
                <span>Cam kết chất lượng</span>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="feature-item">
                <img src="/uploads/features/3.png" alt="Dịch vụ tận tâm">
                <span>Dịch vụ tận tâm</span>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="feature-item">
                <img src="/uploads/features/4.png" alt="Giao hàng nhanh">
                <span>Giao hàng nhanh</span>
            </div>
        </div>
    </div>

    [TOP]
    {MODULE_CONTENT}
    [BOTTOM]
    [FOOTER]
</div>
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->