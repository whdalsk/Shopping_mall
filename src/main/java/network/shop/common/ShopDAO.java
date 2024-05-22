package network.shop.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ShopDAO {
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	String msg;
	int like;
	
	public ShopDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url,"system","1234");
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//CoupangDAO end
	
	public ArrayList<ShopVO> shopSelect() {
		ArrayList<ShopVO> list = new ArrayList<ShopVO>();
		try {	
			msg="select rownum rn, c.* from c_product c";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			
			while(RS.next()==true) {
				ShopVO vo = new ShopVO();
				vo.setRn(RS.getInt("rn"));
				vo.setCode(RS.getInt("code"));
				vo.setName(RS.getString("name"));
				vo.setContent(RS.getString("content"));
				vo.setPrice(RS.getInt("price"));
				vo.setImage(RS.getString("image"));
				vo.setWdate(RS.getDate("wdate"));
				vo.setHit(RS.getInt("hit"));
				vo.setLikes(RS.getInt("likes"));
				list.add(vo);
			}
		} catch (Exception e) {
			
		}//try-catch end
		return list;
	}//end
	
	public ArrayList<ShopVO> shopSelect(String sqry, int start, int end) {
		ArrayList<ShopVO> list = new ArrayList<ShopVO>();
		try {	
			String a="select * from(";			
			String b="select rownum rn, c.* from c_product c "+sqry;			
			String c=") where rn between ? and ?";			
			msg=a+b+c;
			PST = CN.prepareStatement(msg);
			PST.setInt(1, start);
			PST.setInt(2, end);
			RS = PST.executeQuery();
			
			while(RS.next()==true) {
				ShopVO vo = new ShopVO();
				vo.setRn(RS.getInt("rn"));
				vo.setCode(RS.getInt("code"));
				vo.setName(RS.getString("name"));
				vo.setContent(RS.getString("content"));
				vo.setPrice(RS.getInt("price"));
				vo.setImage(RS.getString("image"));
				vo.setWdate(RS.getDate("wdate"));
				vo.setHit(RS.getInt("hit"));
				vo.setLikes(RS.getInt("likes"));
				list.add(vo);
			}
		} catch (Exception e) {
			
		}//try-catch end
		return list;
	}//end
	
	public int shopCount() {
		int total=0;
		try {
			msg="select count(*) cnt from c_product";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if(RS.next()==true) {
				total = RS.getInt("cnt");
			}
		} catch (Exception e) {
			
		}//try-catch end
		return total;
	}//end
	
	public int shopSearchCount(String sqry) {
		int total=0;
		try {
			msg="select count(*) cnt from c_product "+sqry;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			
			if(RS.next()==true) {
				total = RS.getInt("cnt");
			}
		} catch (Exception e) {
			
		}//try-catch end
		return total;
	}//end
	
	public ShopVO shopDetail(int data) {
		ShopVO vo = new ShopVO();
		try {
			msg = "select * from c_product where code = " + data;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if(RS.next()==true){
				vo.setCode(RS.getInt("code"));
				vo.setName(RS.getString("name"));
				vo.setContent(RS.getString("content"));
				vo.setPrice(RS.getInt("price"));
				vo.setImage(RS.getString("image"));
				vo.setWdate(RS.getDate("wdate"));
				vo.setHit(RS.getInt("hit"));
				vo.setLikes(RS.getInt("likes"));
				System.out.println("Detail " + vo.getCode());
			}
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return vo;
	}//end
	
	public void shopHit(int data) {
		try {
			msg = "update c_product set hit=hit+1 where code = ? ";
		    PST = CN.prepareStatement(msg);
		    PST.setInt(1, data);
		    PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public void shopLikes(int data, boolean liked) {
		try {
			if (liked == false) {
	            msg = "UPDATE c_product SET likes = likes - 1 WHERE code = ?";
	        } else {
	            msg = "UPDATE c_product SET likes = likes + 1 WHERE code = ?";
	        }
		    PST = CN.prepareStatement(msg);
		    PST.setInt(1, data);
		    PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public int getLikesCnt() {
		int cnt = 0;
		try {
	        msg = "select count(*) cnt from c_product where likes = 1";
		    PST = CN.prepareStatement(msg);
		    RS = PST.executeQuery();
		    if(RS.next()==true) {
		    	cnt = RS.getInt("cnt");
		    }
		    
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return cnt;
	}//end
	
	public ArrayList<ShopVO> getLikesList() {
		ArrayList<ShopVO> likesList = new ArrayList<ShopVO>();
		try {	
			msg = "select * from c_product where likes=1";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			
			while(RS.next()==true) {
				ShopVO vo = new ShopVO();
				vo.setCode(RS.getInt("code"));
				vo.setName(RS.getString("name"));
				vo.setContent(RS.getString("content"));
				vo.setPrice(RS.getInt("price"));
				vo.setImage(RS.getString("image"));
				vo.setWdate(RS.getDate("wdate"));
				vo.setHit(RS.getInt("hit"));
				vo.setLikes(RS.getInt("likes"));
				likesList.add(vo);
			}
			// 쿼리 실행 후에 결과가 비어 있는지 확인하는 로그 추가
	        if (likesList.isEmpty()) {
	            System.out.println("No results found.");
	        } else {
	            System.out.println("Results found: " + likesList.size());
	        }
	    } catch (Exception e) {
	        // 예외 발생 시 로그 추가
	        e.printStackTrace();
	    }//try-catch end
	    return likesList;
	}//end
	
	public void like(String UserID, int Product_code) { // 좋아요 리스트에 고객 정보 추가
		try {
			msg = "INSERT INTO thumb_up(code, id) VALUES (?, ?)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, Product_code);
			PST.setString(2, UserID);
			if(PST.executeUpdate()>0) {
				System.out.println("좋아요 True");
			}else {
				System.out.println("좋아요 false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end
	
	public void unlike(String UserID, int Product_code) { // 좋아요 리스트에 고객 정보 삭제
		try {
				msg = "DELETE FROM thumb_up WHRER code = ?, id = ?";
				PST = CN.prepareStatement(msg);
				PST.setInt(1, Product_code);
				PST.setString(2, UserID);
				if(PST.executeUpdate()>0) {
					System.out.println("좋아요 삭제 True");
				}else {
					System.out.println("좋아요 삭제 false");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end
	
	public ArrayList<Integer> liked(String UserID) { // 상품 리스트에 좋아요 누른 상품에 대한 이미지 표시 
		ArrayList<Integer> a = new ArrayList<>();
		try {
			msg = "SELECT * FROM thumb_up WHERE ID = ?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, UserID);
			RS=PST.executeQuery();
			while (RS.next() != false) {
				a.add(RS.getInt("code"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}//end

	public ArrayList<CartVO> cartSelect(String id) {
		ArrayList<CartVO> list = new ArrayList<CartVO>();
		try {	
			msg="select * from c_cart where member_id=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, id);
			RS = PST.executeQuery();
			
			while(RS.next()==true) {
				CartVO vo = new CartVO();
				vo.setOrder_num(RS.getInt("order_num"));
				vo.setProduct_num(RS.getInt("product_num"));
				vo.setMember_id(id);
				vo.setName(RS.getString("name"));
				vo.setPrice(RS.getInt("price"));
				vo.setImage(RS.getString("image"));
				vo.setCnt(RS.getInt("cnt"));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return list;
	}//end
	
	public void cartInsert(ArrayList<CartVO> list) {
		try {
			CartVO vo = null;
			for(int i=0; i<list.size(); i++) {
				vo = list.get(i); 
			}
			msg="insert into c_cart values(c_cart_seq.nextval,?,?,?,?,?,?)";
			PST =CN.prepareStatement(msg);
			PST.setInt(1, vo.getProduct_num());
			PST.setString(2, vo.getMember_id());
			PST.setString(3, vo.getName());
			PST.setInt(4, vo.getPrice());
			PST.setString(5, vo.getImage());
			PST.setInt(6, vo.getCnt());
			PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public void cartDelete(String name, String code) {
		try {
			msg="delete from c_cart where member_id=? and product_num=?";
			PST =CN.prepareStatement(msg);
			PST.setString(1, name);
			PST.setString(2, code);
			PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public void cartUpdateAdd(String name, String code) {
		try {
			msg="update c_cart set cnt=cnt+1 where member_id=? and product_num=?";
			PST =CN.prepareStatement(msg);
			PST.setString(1, name);
			PST.setString(2, code);
			PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public void cartUpdateSub(String name, String code) {
		try {
			msg="update c_cart set cnt=cnt-1 where member_id=? and product_num=?";
			PST =CN.prepareStatement(msg);
			PST.setString(1, name);
			PST.setString(2, code);
			PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public int cartCount(String name) {
		int CCtotal=0;
		if(name==null || name=="") {
			return 0;
		}else {
			try {
				msg="select count(*) cnt from c_cart where member_id=?";
				PST =CN.prepareStatement(msg);
				PST.setString(1, name);
				RS = PST.executeQuery();
				if(RS.next()==true) {
					CCtotal=RS.getInt("cnt");
				}//if-end
			} catch (Exception e) {
				System.out.println("에러 이유 : "+e);
			}//try-catch end
			return CCtotal;
		}//if-else end
	}//end
	
	public void ShoppingLike(int Product_code) { // 상품에 대한 좋아요 수
		try {
			PST = CN.prepareStatement("SELECT thumps_up FROM c_product WHERE CODE = ?");
			PST.setInt(1, Product_code);
			RS=PST.executeQuery();
			if(RS.next() != false) {
				like = RS.getInt("thumps_up");
			}
			
			PST = CN.prepareStatement("UPDATE c_product SET thumps_up = ? WHERE CODE = ?");
			PST.setInt(1, ++like);
			PST.setInt(2, Product_code);
			if(PST.executeUpdate()>0) {
				System.out.println("증가");
			}else {
				System.out.println("실패");
			}
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end
	
	public void ShoppingunLike(int Product_code) { // 상품에 대한 좋아요 수
		try {
			PST = CN.prepareStatement("SELECT thumps_up FROM c_product WHERE CODE = ?");
			PST.setInt(1, Product_code);
			RS=PST.executeQuery();
			if(RS.next() != false) {
				if(0 == RS.getInt("thumps_up")) {
					like = 1;
				}else {
					like = RS.getInt("thumps_up");
				}
			}
			
			PST = CN.prepareStatement("UPDATE c_product SET like_num = ? WHERE like_id = ?");
			PST.setInt(1, --like);
			PST.setInt(2, Product_code);
			if(PST.executeUpdate()>0) {
				System.out.println("감소");
			}else {
				System.out.println("실패");
			}
      
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
	}//end

	public int shopReviewCnt(int code) {
		int cnt = 0;
		try {
			msg = "select count(*) cnt from c_productreply where code=?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, code);
			RS = PST.executeQuery();
			if(RS.next()==true) {
				cnt = RS.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return cnt;
	}//end
	
	public ShopVO shopmemberupdate(String id) {
		ShopVO vo = new ShopVO();
		try {
			msg = "select * from c_member where id = '" + id + "'"  ;
			System.out.println(msg);
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if(RS.next()==true){
				vo.setId(RS.getString("id"));
				vo.setPw(RS.getString("pw"));
				vo.setPhoneNum(RS.getString("phone"));
				vo.setEmail(RS.getString("email"));
				vo.setZipcode(RS.getString("zipcode"));
				vo.setAdress1(RS.getString("adress1"));
				vo.setAdress2(RS.getString("adress2"));
			}
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return vo;
	}//end
	
	public int shopSignUp(String[] list) {
		int result = 0;
		try{
			msg = "insert into c_member values(?, ?, ?, ?, ?, ?, ?)";
			PST =CN.prepareStatement(msg);
			for(int i=0; i<list.length; i++) {
				PST.setString(1, list[0]);
			}
			PST.setString(1, list[0]);
			PST.setString(2, list[1]);
			PST.setString(3, list[2]);
			PST.setString(4, list[3]);
			PST.setString(5, list[4]);
			PST.setString(6, list[5]);
			PST.setString(7, list[6]);

			int OK = PST.executeUpdate();
			if(OK>0) {
				result = 1;
			}
			
			msg = "insert into c_login values(?, ?)";
			PST =CN.prepareStatement(msg);
			PST.setString(1, list[0]);
			PST.setString(2, list[1]);
			PST.executeUpdate();
			
			//System.out.println("결과 : "+result);
		} catch(Exception e){
			e.printStackTrace();
		}//try-catch end
		return result;
	}//end
	
	public int shopIdCheck(String id) {
		int cnt = 0;
		try {
			msg = "select count(*) cnt from c_member where id=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, id);
			RS = PST.executeQuery();
			if(RS.next()==true) {
				cnt = RS.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return cnt;
	}//end
	
	public int contactInsert(String name, String email, String subject, String message) {
		int OK = 0;
		try {
			msg = "insert into contact values(?,?,?,?,contact_seq.nextval)";
			PST = CN.prepareStatement(msg);
			PST.setString(1, name);
			PST.setString(2, email);
			PST.setString(3, subject);
			PST.setString(4, message);
			OK = PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러 이유 : "+e);
		}//try-catch end
		return OK;
	}//end


}//class ShopDAO END
