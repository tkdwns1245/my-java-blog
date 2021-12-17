package com.ssj.myapp.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.ssj.myapp.dao.LifeDAO;
import com.ssj.myapp.dao.ProjectDAO;
import com.ssj.myapp.dao.StudyDAO;
import com.ssj.myapp.vo.LifeVO;
import com.ssj.myapp.vo.ProjectVO;
import com.ssj.myapp.vo.RecentPostVO;
import com.ssj.myapp.vo.StudyVO;

@Service("recentPostService")
public class RecentPostServiceImpl implements RecentPostService {

	@Inject
	@Named("studyDao")
	StudyDAO studyDao;
	@Inject
	@Named("projectDao")
	ProjectDAO projectDao;
	@Inject
	@Named("lifeDao")
	LifeDAO lifeDao;
	
	@Override
	public List<RecentPostVO> selectRecentPostList() throws Exception {
		List<RecentPostVO> rpVOList = new ArrayList<RecentPostVO>();
		List<ProjectVO> pVOList;
		List<StudyVO> sVOList;
		List<LifeVO> lVOList;
		RecentPostVO tmpRecentPost;
		pVOList = projectDao.selectRecentProjectList();
		sVOList = studyDao.selectRecentStudyList();
		lVOList = lifeDao.selectRecentLifeList();
		
		for(int i=0; i < pVOList.size(); i++) {
			tmpRecentPost = new RecentPostVO();
			tmpRecentPost.setType("project");
			tmpRecentPost.setNum(pVOList.get(i).getNum());
			tmpRecentPost.setPostName(pVOList.get(i).getProjectName());
			tmpRecentPost.setIntroduce(pVOList.get(i).getIntroduce());
			tmpRecentPost.setPostImg(pVOList.get(i).getProjectImg());
			tmpRecentPost.setCreateDate(pVOList.get(i).getCreateDate());
			rpVOList.add(tmpRecentPost);
		}
		for(int i=0; i < sVOList.size(); i++) {
			tmpRecentPost = new RecentPostVO();
			tmpRecentPost.setType("study");
			tmpRecentPost.setNum(sVOList.get(i).getNum());
			tmpRecentPost.setPostName(sVOList.get(i).getTitle());
			tmpRecentPost.setIntroduce(sVOList.get(i).getIntroduce());
			tmpRecentPost.setPostImg(sVOList.get(i).getTitleImg());
			tmpRecentPost.setCreateDate(sVOList.get(i).getCreateDate());
			rpVOList.add(tmpRecentPost);
		}
		for(int i=0; i < lVOList.size(); i++) {
			tmpRecentPost = new RecentPostVO();
			tmpRecentPost.setType("life");
			tmpRecentPost.setNum(lVOList.get(i).getNum());
			tmpRecentPost.setPostName(lVOList.get(i).getTitle());
			tmpRecentPost.setIntroduce(lVOList.get(i).getIntroduce());
			tmpRecentPost.setPostImg(lVOList.get(i).getTitleImg());
			tmpRecentPost.setCreateDate(lVOList.get(i).getCreateDate());
			rpVOList.add(tmpRecentPost);
		}
		rpVOList.sort(Collections.reverseOrder());
		return rpVOList;
	}

}
