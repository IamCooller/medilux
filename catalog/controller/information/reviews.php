


<?php

class ControllerInformationReviews extends Controller
{
   
	public function index() {
 
        $this->load->language('information/reviews');

        $this->document->setTitle($this->language->get('Title'));
         
        $data['breadcrumbs'] = array();
         
        $data['breadcrumbs'][] = array(
        'text' => $this->language->get('text_home'),
        'href' => $this->url->link('common/home')
        );
         
        $data['breadcrumbs'][] = array(
        'text' => $this->language->get('heading_title'),
        'href' => $this->url->link('information/reviews')
        );

        
      
        $this->load->language('product/product');
    
        $this->load->model('catalog/review');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        if (isset($this->request->get['product_id'])) {
            $product_id = $this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        $product_id = 54;
        $data['reviews'] = array();


        
       

        $results = $this->model_catalog_review->getTotalAllReviewsByProductId();

        var_dump($review_total);

        foreach ($results as $result) {
            $data['reviews'][] = array(
                'author'     => $result['author'],
                'text'       => nl2br($result['text']),
                'image'     => ($result['image']),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

     /*    $pagination = new Pagination();
        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = 5;
        $pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5)); */

       
     
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
         
        $this->response->setOutput($this->load->view('information/reviews', $data));
        

        }
    
}