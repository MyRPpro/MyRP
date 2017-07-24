package com.pro.myrp.persistence.attitude;

import com.pro.myrp.domain.attitude_management.AttitudeVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface AttitudeDAO extends MyRPDAO {
//
	public int insert_attitude(AttitudeVO vo);
}
