<!-- BEGIN: no_data -->
<div class="alert alert-warning">Không có sản phẩm!</div>
<!-- END: no_data -->

<!-- BEGIN: main -->
<div class="row viewgrid shops-viewgrid shops-viewgrid-{MODULE_NAME}">
    <!-- BEGIN: loop -->
    <div class="col-xs-12 col-sm-12 col-md-6">
        <div class="shop-item">
            <div class="item-image">
                <a href="{ROW.link_pro}" title="{ROW.title}"><img src="{ROW.homeimgthumb}" alt="{ROW.title}"></a>
            </div>
            <div class="info_pro">
                <!-- BEGIN: discounts -->
                <span class="label label-danger sale-label">Giảm {PRICE.discount_percent}{PRICE.discount_unit}</span>
                <!-- END: discounts -->
            </div>
            <div class="caption">
                <h3>
                    <a href="{ROW.link_pro}" title="{ROW.title}">{ROW.title}</a>
                </h3>
                <div class="desc hide">{ROW.hometext}</div>
                <p class="label label-default"></p>
                <!-- BEGIN: price -->
                <p class="price">
                    <!-- BEGIN: discounts -->
                    <span class="money">{PRICE.sale_format}{PRICE.unit}</span> <del class="discounts_money">{PRICE.price_format}{PRICE.unit}</del>
                    <!-- END: discounts -->
                    <!-- BEGIN: no_discounts -->
                    <span class="money">{PRICE.price_format}{PRICE.unit}</span>
                    <!-- END: no_discounts -->
                </p>
                <!-- END: price -->
                <!-- BEGIN: contact -->
                <p class="price">
                    <span class="money">{LANG.price_contact}</span>
                </p>
                <!-- END: contact -->
                <!-- BEGIN: order -->
                <div class="clearfix item-product-buttons">
                    <a href="javascript:void(0)" id="{ROW.id}" title="{ROW.title}" onclick="cartorder(this,0, '{ROW.link_pro}'); return !1;"><button type="button" class="btn btn-primary btn-xs btn-add-to-cart"><em class="fa fa-shopping-cart"></em> {LANG.add_cart}</button></a>

                    <a href="{ROW.link_pro}" title="{ROW.title}" class="btn-view-detail"><em class="fa fa-eye"></em></a>
                </div>
                <!-- END: order -->
                <!-- BEGIN: wishlist -->
                <a href="javascript:void(0)" title="{ROW.title}"><button type="button" onclick="wishlist({ROW.id}, this)" class="btn btn-primary btn-xs <!-- BEGIN: disabled -->disabled<!-- END: disabled -->">{LANG.wishlist}</button></a>
                <!-- END: wishlist -->

                <!-- BEGIN: product_empty -->
                <button class="btn btn-danger disabled btn-xs btn-out-of-stock">{LANG.product_empty}</button>
                <!-- END: product_empty -->
            </div>
        </div>
    </div>
    <!-- END: loop -->
</div>
<!-- END: main -->