<!-- BEGIN: main -->
<div class="section-hotdeal">
    <h2><a href="{BLOCK_INFO.link}"><img src="{BLOCK_INFO.image}" alt="">{BLOCK_INFO.vi_title}</a></h2>
    <div class="row viewgrid shops-viewgrid">
        <!-- BEGIN: items -->
        <div class="col-xs-12 col-sm-12 col-md-6">
            <div class="shop-item">

                <div class="item-image">
                    <a href="{LINK}" title="{TITLE}"><img src="{SRC_IMG}" alt="{TITLE}"></a>
                </div>
                <div class="info_pro">
                    <!-- BEGIN: discounts -->
                    <span class="label label-danger sale-label">Giảm
                        {PRICE.discount_percent}{PRICE.discount_unit}</span>
                    <!-- END: discounts -->
                    <!-- BEGIN: point -->
                    <span class="label label-info" title="{point_note}">+{point}</span>
                    <!-- END: point -->
                    <!-- BEGIN: gift -->
                    <span class="label label-success">+<em class="fa fa-gift fa-lg">&nbsp;</em></span>
                    <!-- END: gift -->
                </div>
                <div class="caption">
                    <h3>
                        <a href="{LINK}" title="{TITLE}">{TITLE}</a>
                    </h3>
                    <div class="desc hide">{HOMETEXT}</div>
                    <!-- BEGIN: product_code -->
                    <p class="label label-default">{PRODUCT_CODE}</p>
                    <!-- END: product_code -->
                    <!-- BEGIN: price -->
                    <p class="price">
                        <!-- BEGIN: discounts -->
                        <span class="money">{PRICE.sale_format}{PRICE.unit}</span> <del
                            class="discounts_money">{PRICE.price_format}{PRICE.unit}</del>
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
                        <a href="javascript:void(0)" id="{ID}" title="{TITLE}" onclick="cartorder(this, {GROUP_REQUIE}, '{LINK}'); return !1;"><button type="button" class="btn btn-primary btn-xs btn-add-to-cart"><em class="fa fa-shopping-cart"></em> {LANG.add_cart}</button></a>
                        
                        <a href="{LINK}" title="{TITLE}" class="btn-view-detail"><em class="fa fa-eye"></em></a>
                    </div>
                    <!-- END: order -->
                    
                    <!-- BEGIN: product_empty -->
                    <button class="btn btn-danger disabled btn-xs btn-out-of-stock">{LANG.product_empty}</button>
                    <!-- END: product_empty -->
                </div>
            </div>
        </div>
        <!-- END: items -->
    </div>
</div>
<!-- END: main -->