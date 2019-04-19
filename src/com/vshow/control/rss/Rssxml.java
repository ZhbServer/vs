package com.vshow.control.rss;

import java.net.URL;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.vshow.control.data.Rss;
import com.vshow.control.tool.SqlConnect;

public class Rssxml {

	public void doNews(String urlStr, int id) throws Exception {
		try {

			URL feedUrl = new URL(urlStr);
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));
			List list = feed.getEntries();
			String content = "";
			for (int i = 0; i < list.size(); i++) {
				SyndEntry entry = (SyndEntry) list.get(i);
				content += entry.getDescription().getValue() + "<br>";
			}
			Rss rss = new Rss();
			rss.setContent(content);
			rss.setId(id);
			SqlMapClient sm = SqlConnect.getSqlMapInstance();
			sm.update("update_newcontent", rss);
			
		} catch (Exception e) {
			
		}
	}
}
