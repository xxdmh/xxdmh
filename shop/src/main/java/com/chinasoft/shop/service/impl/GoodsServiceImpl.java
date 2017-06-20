package com.chinasoft.shop.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.mapper.GoodsMapper;
import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.service.GoodsService;
import com.chinasoft.shop.utils.Uuid;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsMapper gm;

	@Override
	public void addGoods(Goods goods) {
		goods.setId(Uuid.getUuid());
		gm.addGoods(goods);
	}

	@Override
	public List<Goods> findAll() {
		return gm.findAll();
	}

	@Override
	public Goods findById(String id) {
		return gm.findById(id);
	}

	@Override
	public Goods findById2(String id) {
		return gm.findById2(id);
	}

	@Override
	public void update(Goods goods) {
		gm.update(goods);
		
	}

	@Override
	public List<Goods> findByLatest() {
		return gm.findByLatest();
	}

	@Override
	public List<Goods> finfByHottest() {
		return gm.findByHottest();
	}
	public void searchGoods(){
	    List<Goods> goods = gm.findAll();
	    SolrClient client = new HttpSolrClient.Builder("http://172.4.14.139:8983/solr/xxdmh").build();
	    for (Goods goods2 : goods) {
		SolrInputDocument document = new SolrInputDocument();
		document.addField("id", goods2.getId());
		document.addField("salePrice", goods2.getSalePrice());
		document.addField("name", goods2.getName());
		document.addField("image", goods2.getImage());
		document.addField("description", goods2.getDescription());
		try {
		    client.add(document);
		} catch (SolrServerException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}
	    }
		try {
		    client.commit();
		} catch (SolrServerException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}

	@Override
	public List<Goods> findByCateId(String id) {
		return gm.findByCateId(id);
	}

	@Override
	public List<Goods> findBySaleNums(String id) {
		return gm.findBySaleNums(id);
	}

	@Override
	public List<Goods> findByHottest5() {
		return gm.findByHottest5();
	}


}
