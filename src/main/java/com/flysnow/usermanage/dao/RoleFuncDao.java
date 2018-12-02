package com.flysnow.usermanage.dao;

import com.flysnow.usermanage.model.RoleFunc;
import com.flysnow.common.Page;
import java.util.List;
import java.util.Map;

/**
 * @description 角色功能数据层操作接口
 * @description 角色功能对象
 * @author huangyongsheng
 * @version 1.0.0
 * @createtime 2018-12-02
 */
public abstract interface RoleFuncDao{

	/**
	 * @description 增加
	 * @param entity
	 * @return
	 */
	public abstract RoleFunc insert(RoleFunc entity);

	/**
	 * @description 删除
	 * @param entity
	 * @return
	 */
	public abstract int delete(RoleFunc entity);

	/**
	 * @description 修改
	 * @param entity
	 * @return
	 */
	public abstract int update(RoleFunc entity);

	/**
	 * @description 查询单条
	 * @param entity
	 * @return
	 */
	public abstract RoleFunc get(RoleFunc entity);

	/**
	 * @description 多条查询
	 * @param entity
	 * @return
	*/
	public abstract List getList(RoleFunc entity);

	/**
	 * @description 分页查询
	 * @param map
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public abstract Page getListForPage(Map map, int pageNo, int pageSize);

}