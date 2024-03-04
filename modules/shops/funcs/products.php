<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC <contact@vinades.vn>
 * @Copyright (C) 2017 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */

if (!defined('NV_IS_MOD_SHOPS')) {
    die('Stop!!!');
}

$page = 1;
$ajax = $nv_Request->isset_request('ajax', 'get,post');
$listgroupid = $nv_Request->get_string('listgroupid', 'get,post', '');
$array_id_group = [];

if ($ajax) {
    // Xem qua ajax (lọc theo loại sản phẩm)
    $page = $nv_Request->get_int('page', 'get,post', 1);
    if (!empty($listgroupid)) {
        $array_id_group = array_map('intval', explode(',', $listgroupid));
    }
}

if (preg_match('/^page\-([0-9]+)$/', (isset($array_op[1]) ? $array_op[1] : ''), $m)) {
    $page = (int) $m[1];
}

$page_title = $module_info['custom_title'];
$key_words = $module_info['keywords'];

$array_mod_title[] = [
    'title' => 'Tất cả sản phẩm'
];

$nv_Request->get_int('sorts', 'session', 0);
$sorts = $nv_Request->get_int('sort', 'post', 0);
$sorts_old = $nv_Request->get_int('sorts', 'session', $pro_config['sortdefault']);
$sorts = $nv_Request->get_int('sorts', 'post', $sorts_old);

$compare_id = $nv_Request->get_string($module_data . '_compare_id', 'session', '');
$compare_id = unserialize($compare_id);

/*
 * Xem theo loại sản phẩm trên URL
 * Quy luật: GroupAliasLev1--GroupAliasLev2/GroupAliasLev1--GroupAliasLev2/...
 * Lưu ý: Sort lại mảng sau đó build ra lại url để có URL không trùng lặp tiêu đề
 */
unset($array_op[0]);
$array_url_group = $array_url_group_alias = [];
foreach ($array_op as $_inurl) {
    if (preg_match('/^page\-([0-9]+)$/', $_inurl, $m)) {
        $page = $m[1];
    } elseif (preg_match('/^([a-z0-9\-]+)\-\-([a-z0-9\-]+)$/i', $_inurl, $m)) {
        /*
         * Trong phần quản lý nhóm chỉ có hai cấp do đó
         * Xác định được groupid lev1 thì có nghĩa $m[2] đã là lev2
         */
        $m[2] = strtolower($m[2]);
        $_groupid_lev2 = isset($global_array_group_alias[$m[2]]) ? $global_array_group_alias[$m[2]] : 0;
        $_groupid_lev1 = $_groupid_lev2 ? $global_array_group[$_groupid_lev2]['parentid'] : 0;

        if ($_groupid_lev2 and $_groupid_lev1) {
            $array_id_group[] = $_groupid_lev2;
            $array_url_group[$global_array_group[$_groupid_lev1]['alias']][] = $global_array_group[$_groupid_lev2]['alias'];
            $array_url_group_alias[] = $global_array_group[$_groupid_lev1]['alias'] . '--' . $global_array_group[$_groupid_lev2]['alias'];
        }
    }
}

$contents = '';
$cache_file = '';

$base_url = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $site_mods[$module_name]['alias']['products'];
$base_url_internal = str_replace('&amp;', '&', $base_url);
$base_url_rewrite = nv_url_rewrite($base_url_internal, true);
$page_url_rewrite = ($page > 1) ? nv_url_rewrite($base_url_internal . '/page-' . $page, true) : $base_url_rewrite;

$request_uri = $_SERVER['REQUEST_URI'];

// if (!defined('NV_IS_MODADMIN') and $page < 5 and !$ajax) {
//     $cache_file = NV_LANG_DATA . '_' . $module_info['template'] . '_' . $op . '_' . $page . '_' . NV_CACHE_PREFIX . '.cache';
//     if (($cache = $nv_Cache->getItem($module_name, $cache_file)) != false) {
//         $contents = $cache;
//     }
// }

if (empty($contents)) {
    $data_content = array();
    $html_pages = '';
    $orderby = '';
    if ($sorts == 0) {
        $orderby = ' id DESC ';
    } elseif ($sorts == 1) {
        $orderby = ' t1.product_price ASC, t1.id DESC ';
    } else {
        $orderby = ' t1.product_price DESC, t1.id DESC ';
    }

    // Lọc sản phẩm theo nhóm
    $sql_groups = '';
    if (!empty($array_id_group)) {
        $arr_id = [];
        $array_id_group = array_unique($array_id_group);
        foreach ($array_id_group as $id_group) {
            $group = $global_array_group[$id_group];
            $arr_id[$group['parentid']][] = $id_group;
        }

        $sql_groups = 'SELECT DISTINCT pro_id FROM ' . $db_config['prefix'] . '_' . $module_data . '_group_items WHERE ';
        $j = 1;
        foreach ($arr_id as $listid) {
            $a = sizeof($listid);
            if ($a > 0) {
                $arr_sql = [];
                for ($i = 0; $i < $a; $i++) {
                    $arr_sql[] = ' pro_id IN (SELECT pro_id FROM ' . $db_config['prefix'] . '_' . $module_data . '_group_items WHERE group_id=' . $listid[$i] . ')';
                }
                $sql_groups .= ' (' . implode(' OR ', $arr_sql) . ')';
            }
            if ($j < sizeof($arr_id)) {
                $sql_groups .= ' AND ';
            }
            $j++;
        }

        $sql_groups = ' AND t1.id IN ( ' . $sql_groups . ' )';
    }

    $db->sqlreset()
        ->select('COUNT(*)')
        ->from($db_config['prefix'] . '_' . $module_data . '_rows t1')
        ->where('t1.inhome=1 AND t1.status =1 ' .  $sql_groups);

    $num_items = $db->query($db->sql())
        ->fetchColumn();

    $db->select('id, listcatid, publtime, ' . NV_LANG_DATA . '_title, ' . NV_LANG_DATA . '_alias, ' . NV_LANG_DATA . '_hometext, homeimgalt, homeimgfile, homeimgthumb, product_code, product_number, product_price, money_unit, showprice,' . NV_LANG_DATA . '_gift_content, gift_from, gift_to')
        ->order($orderby)
        ->limit($per_page)
        ->offset(($page - 1) * $per_page);

    $result = $db->query($db->sql());

    while (list($id, $listcatid, $publtime, $title, $alias, $hometext, $homeimgalt, $homeimgfile, $homeimgthumb, $product_code, $product_number, $product_price, $money_unit, $showprice, $gift_content, $gift_from, $gift_to) = $result->fetch(3)) {
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

        $data_content[] = array(
            'id' => $id,
            'listcatid' => $listcatid,
            'publtime' => $publtime,
            'title' => $title,
            'alias' => $alias,
            'hometext' => $hometext,
            'homeimgalt' => $homeimgalt,
            'homeimgthumb' => $thumb,
            'product_price' => $product_price,
            'product_number' => $product_number,
            'product_code' => $product_code,
            'money_unit' => $money_unit,
            'showprice' => $showprice,
            'newday' => $global_array_shops_cat[$listcatid]['newday'],
            'gift_content' => $gift_content,
            'gift_from' => $gift_from,
            'gift_to' => $gift_to,
            'link_pro' => NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $global_array_shops_cat[$listcatid]['alias'] . '/' . $alias . $global_config['rewrite_exturl'],
            'link_order' => NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=setcart&amp;id=' . $id
        );
    }

    if (empty($data_content) and $page > 1) {
        nv_redirect_location(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name, true);
    }

    $base_url = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $site_mods[$module_name]['alias']['products'];
    $html_pages = nv_alias_page($page_title, $base_url, $num_items, $per_page, $page);

    $contents = nv_template_view_all($data_content, $compare_id, $html_pages, $sorts, $pro_config['home_view']);

    // if (!defined('NV_IS_MODADMIN') and $contents != '' and $cache_file != '' and !$ajax) {
    //     $nv_Cache->setItem($module_name, $cache_file, $contents);
    // }
}

if ($page > 1) {
    $page_title .= ' ' . NV_TITLEBAR_DEFIS . ' ' . $lang_global['page'] . ' ' . $page;
    $description .= ' ' . $page;
}

include NV_ROOTDIR . '/includes/header.php';
if ($ajax) {
    echo $contents;
} else {
    echo nv_site_theme($contents);
}
include NV_ROOTDIR . '/includes/footer.php';
