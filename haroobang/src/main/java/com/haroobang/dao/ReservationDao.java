package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

public interface ReservationDao {

	List<ReservationVO> selectAllReservations();

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

}
//썅