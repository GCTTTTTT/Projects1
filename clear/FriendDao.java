package dao;

import pojo.Friend;

import java.util.ArrayList;

public interface FriendDao {
	// 1.������������
		public boolean insertFriend(String friend_name,String friend_url);
	// 2.ɾ����������
		public boolean delFriend(int friend_id);
	// 3.������е���������
		public ArrayList<Friend> getAllFriend();
	// 4.������е���������֮��ҳ
		public ArrayList<Friend> getPageFriend(int page,int limit);
	// 5.������������
		public boolean updateFriend(Friend f);
	// ͨ��id���������Ϣ
		public Friend getOneFriend(int friend_id);
}
