<?php

class ModelExtensionWfmmenu extends Model
{

    public function addItem($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "wfmmenu SET title = '" . $this->db->escape($data['title']) . "', link = '" . $this->db->escape($data['link']) . "', parent_id = " . (int)$data['parent'] . ', image = "' . $this->db->escape($data['image']) . '"');
        return $this->db->getLastId();
    }

    public function editItem($wfmmenu_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "wfmmenu SET image = '" . $this->db->escape($data['image']) . "', title = '" . $this->db->escape($data['title']) . "', link = '" . $this->db->escape($data['link']) . "', parent_id = " . (int)$data['parent'] . " WHERE id = '" . (int)$wfmmenu_id . "'");
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

	public function deleteWfmmenu($wfmmenu_id) {

        $this->db->query("DELETE FROM " . DB_PREFIX . "wfmmenu  WHERE id = '" . (int)$wfmmenu_id . "'");


		$this->cache->delete('wfmmenu');
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
