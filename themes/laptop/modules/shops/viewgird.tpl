<!-- BEGIN: main -->
<div class="row viewgrid shops-viewgrid shops-viewgrid-{MODULE_NAME}">
    <!-- BEGIN: loop -->
    <div class="col-xs-12 col-sm-12 col-md-{NUM}">
        <div class="shop-item">
            <div class="item-image">
                <a href="{ROW.link_pro}" title="{ROW.title}"><img src="{ROW.homeimgthumb}" alt="{ROW.title}"
                <!-- BEGIN: tooltip_js -->data-content='{ROW.hometext}' data-rel="tooltip"<!-- END: tooltip_js -->></a>
            </div>
            <div class="info_pro">
                <!-- BEGIN: discounts -->
                <span class="label label-danger sale-label">Giảm {PRICE.discount_percent}{PRICE.discount_unit}</span>
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
                    <a href="{ROW.link_pro}" title="{ROW.title}">{ROW.title}</a>
                </h3>
                <div class="desc hide">{ROW.hometext}</div>
                <!-- BEGIN: product_code -->
                <p class="label label-default">{PRODUCT_CODE}</p>
                <!-- END: product_code -->
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
                <!-- BEGIN: compare -->
                <p>
                    <input type="checkbox" value="{ROW.id}" {ch} onclick="nv_compare({ROW.id});" id="compare_{ROW.id}" /><a href="#" onclick="nv_compare_click();">&nbsp;{LANG.compare}</a>
                </p>
                <!-- END: compare -->

                <!-- BEGIN: order -->
                <div class="clearfix item-product-buttons">
                    <a href="javascript:void(0)" id="{ROW.id}" title="{ROW.title}" onclick="cartorder(this, {GROUP_REQUIE}, '{ROW.link_pro}'); return !1;"><button type="button" class="btn btn-primary btn-xs btn-add-to-cart"><em class="fa fa-shopping-cart"></em> {LANG.add_cart}</button></a>
                    
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
    <!-- BEGIN: page -->
    <div class="text-center w-100 gen-page">{PAGE}</div>
    <!-- END: page -->
</div>
<!-- BEGIN: tooltip_js -->
<script type="text/javascript" data-show="after">
    $(document).ready(function() {
        $("[data-rel='tooltip']").tooltip({
            placement : "bottom",
            html : true,
            title : function() {
                return '<p class="text-justify">' + $(this).data('content') + '</p><div class="clearfix"></div>';
            }
        });
    });
</script>
<!-- END: tooltip_js -->
<!-- END: main -->
