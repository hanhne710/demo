<?php
if (!defined('NV_IS_MOD_SHOPS')) {
    die('Stop!!!');
}

$catid = $nv_Request->get_int('catid', 'get, post', 0);
$limit = 4;

$array_cat = array();
$array_cat = GetCatidInParent($catid);

$link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=';

if ($catid == 0) {
    $_where = 't1.status=1';
} else {
    $_where = 't1.listcatid IN (' . implode(',', $array_cat) . ') AND t1.status=1';
}
$db
    ->sqlreset()
    ->select('t1.id, t1.listcatid, t1.publtime, t1.' . NV_LANG_DATA . '_title, t1.' . NV_LANG_DATA . '_alias, t1.' . NV_LANG_DATA . '_hometext, t1.homeimgalt, t1.homeimgfile, t1.homeimgthumb, t1.product_code, t1.product_number, t1.product_price, t1.money_unit, t1.discount_id, t1.showprice,t1.' . NV_LANG_DATA . '_gift_content, t1.gift_from, t1.gift_to, t2.newday')
    ->from($db_config['prefix'] . '_' . $module_data . '_rows t1')
    ->join('INNER JOIN ' . $db_config['prefix'] . '_' . $module_data . '_catalogs t2 ON t2.catid = t1.listcatid')
    ->where($_where)
    ->order("id DESC ")
    ->limit($limit);

$result = $db->query($db->sql());

$data_pro = array();

while (list($id, $listcatid, $publtime, $title, $alias, $hometext, $homeimgalt, $homeimgfile, $homeimgthumb, $product_code, $product_number, $product_price, $money_unit, $discount_id, $showprice, $gift_content, $gift_from, $gift_to, $newday) = $result->fetch(3)) {
    if ($homeimgthumb == 1) {
        //image thumb

        $thumb = NV_BASE_SITEURL . NV_FILES_DIR . '/' . $module_upload . '/' . $homeimgfile;
    } elseif ($homeimgthumb == 2) {
        //image file

        $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $homeimgfile;
    } elseif ($homeimgthumb == 3) {
        //image url

        $thumb = $homeimgfile;
    } else {
        //no image

        $thumb = NV_BASE_SITEURL . 'themes/' . $module_info['template'] . '/images/' . $module_file . '/no-image.jpg';
    }
    $data_pro[] = array(
        'id' => $id,
        'listcatid' => $listcatid,
        'publtime' => $publtime,
        'title' => $title,
        'alias' => $alias,
        'hometext' => $hometext,
        'homeimgalt' => $homeimgalt,
        'homeimgthumb' => $thumb,
        'product_code' => $product_code,
        'product_number' => $product_number,
        'product_price' => $product_price,
        'discount_id' => $discount_id,
        'money_unit' => $money_unit,
        'showprice' => $showprice,
        'newday' => $newday,
        'gift_content' => $gift_content,
        'gift_from' => $gift_from,
        'gift_to' => $gift_to,
        'link_pro' => nv_url_rewrite($link . $global_array_shops_cat[$listcatid]['alias'] . '/' . $alias, true),
        'link_order' => nv_url_rewrite($link . 'setcart&amp;id=' . $id, true)
    );
}




$xtpl = new XTemplate('template_load_products.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/shops');
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('MODULE_NAME', $module_name);
if ($data_pro) {
    foreach ($data_pro as $product) {
        $xtpl->assign('MONEY_UNIT', $pro_config['money_unit']);
        $xtpl->assign('ROW', $product);
        $price = nv_get_price($product['id'], $pro_config['money_unit']);

        if ($pro_config['active_price'] == '1') {
            if ($product['showprice'] == '1') {
                $xtpl->assign('PRICE', $price);
                if ($product['discount_id'] and $price['discount_percent'] > 0) {
                    $xtpl->parse('main.loop.price.discounts');
                    $xtpl->parse('main.loop.price.discounts.standard');
                } else {
                    $xtpl->parse('main.loop.price.no_discounts');
                }
                $xtpl->parse('main.loop.price');
            } else {
                $xtpl->parse('main.loop.contact');
            }
        }
        if ($pro_config['active_order'] == '1' and $pro_config['active_order_non_detail'] == '1') {
            if ($product['showprice'] == '1' && !empty($product['product_price'])) {
                if ($product['product_number'] > 0) {
                    // Kiem tra nhom bat buoc chon khi dat hang
                    $listgroupid = GetGroupID($product['id']);
                    $group_requie = 0;
                    if (!empty($listgroupid) and !empty($global_array_group)) {
                        foreach ($global_array_group as $groupinfo) {
                            if ($groupinfo['in_order']) {
                                $group_requie = 1;
                                break;
                            }
                        }
                    }
                    $group_requie = $pro_config['active_order_popup'] ? 1 : $group_requie;
                    $xtpl->assign('GROUP_REQUIE', $group_requie);

                    $xtpl->parse('main.loop.order');
                } else {
                    $xtpl->parse('main.loop.product_empty');
                }
            }
        }
        if ($pro_config['active_wishlist']) {
            if (!empty($array_wishlist_id)) {
                if (in_array($product['id'], $array_wishlist_id)) {
                    $xtpl->parse('main.loop.wishlist.disabled');
                }
            }
            $xtpl->parse('main.loop.wishlist');
        }

        if ($price['discount_percent'] > 0 and $product['showprice']) {
            $xtpl->parse('main.loop.discounts');
        }

        $xtpl->parse('main.loop');
    }

    $xtpl->parse('main');
    echo $xtpl->text('main');
} else {
    $xtpl->parse('no_data');
    echo $xtpl->text('no_data');
}
