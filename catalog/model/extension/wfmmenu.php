<?php

class ModelExtensionWfmmenu extends Model
{
    private $list = [];

    public function getParent() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "wfmmenu WHERE `parent_id` = 0");
        $this->list = $query->rows;
        return $this->list;
    }

    public function getChildren($id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "wfmmenu WHERE `parent_id` = ".$id);
        
        return $query->rows;
    }

    public function getItem($wfmmenu_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "wfmmenu WHERE id = '" . (int)$wfmmenu_id . "'");

        return $query->row;
    }

    public function getTreeItems()
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "wfmmenu");
        $menu = [];
        foreach ($query->rows as $row) {
            $menu[$row['id']] = $row;
        }
       
        return $menu;
    }


    public function getMapTree($dataset)
    {
        $tree = [];

        foreach ($dataset as $id => &$node) {
            if (!$node['parent_id']) {
                $tree[$id] = &$node;
            } else {
                $dataset[$node['parent_id']]['children'][$id] = &$node;
            }
        }

        return $tree;
    }

}
