package com.delphinium.controller;

import com.delphinium.action.board.NoticeDeleteAction;
import com.delphinium.action.board.NoticeEditAction;
import com.delphinium.action.board.NoticeEditFormAction;
import com.delphinium.action.board.NoticeListAction;
import com.delphinium.action.board.NoticeViewAction;
import com.delphinium.action.board.NoticeWriteAction;
import com.delphinium.action.board.NoticeWriteFormAction;
import com.delphinium.action.board.PromotionDeleteAction;
import com.delphinium.action.board.PromotionEditAction;
import com.delphinium.action.board.PromotionEditFormAction;
import com.delphinium.action.board.PromotionListAction;
import com.delphinium.action.board.PromotionViewAction;
import com.delphinium.action.board.PromotionWriteAction;
import com.delphinium.action.board.PromotionWriteFormAction;
import com.delphinium.action.member.ConEditAction;
import com.delphinium.action.member.ConJoinAction;
import com.delphinium.action.member.ConJoinFormAction;
import com.delphinium.action.member.ConIDCheckAction;
import com.delphinium.action.member.MarJoinFormAction;
import com.delphinium.action.member.MarketViewAction;
import com.delphinium.action.member.MemberDeleteAction;
import com.delphinium.action.member.MemberEditFormAction;
import com.delphinium.action.member.JoinSelectAction;
import com.delphinium.action.member.LoginAction;
import com.delphinium.action.member.LoginFormAction;
import com.delphinium.action.member.LogoutAction;
import com.delphinium.action.member.MainAction;
import com.delphinium.action.member.MarEditAction;
import com.delphinium.action.member.MarIDCheckAction;
import com.delphinium.action.member.MarJoinAction;
import com.delphinium.action.member.MemberListAction;
import com.delphinium.action.member.MemberSearchAction;
import com.delphinium.action.member.MemberViewAction;
import com.delphinium.action.member.MyPageSelectAction;
import com.delphinium.util.Action;
import com.delphinium.action.merchandise.MDRegiAction;
import com.delphinium.action.merchandise.MDRegiFormAction;
import com.delphinium.action.merchandise.MDSearchAction;
import com.delphinium.action.merchandise.MDSelectAction;
import com.delphinium.action.merchandise.MarMDListAction;
import com.delphinium.action.merchandise.MarMDSearchAction;
import com.delphinium.action.order.AddCartAction;
import com.delphinium.action.order.CartAction;
import com.delphinium.action.order.DeleteCartAction;
import com.delphinium.action.order.OrderListAction;
import com.delphinium.action.order.OrderAction;
import com.delphinium.action.order.OrderSearchAction;
import com.delphinium.action.order.OrderViewAction;
import com.delphinium.action.qna.OwnQnAViewAction;
import com.delphinium.action.qna.QnADeleteAction;
import com.delphinium.action.qna.QnAEditAction;
import com.delphinium.action.qna.QnAEditFormAction;
import com.delphinium.action.qna.QnAListAction;
import com.delphinium.action.qna.QnAWriteAction;
import com.delphinium.action.qna.QnAWriteFormAction;
import com.delphinium.action.review.OwnReviewAction;
import com.delphinium.action.review.ReviewDeleteAction;
import com.delphinium.action.review.ReviewEditAction;
import com.delphinium.action.review.ReviewEditFormAction;
import com.delphinium.action.review.ReviewListAction;
import com.delphinium.action.review.ReviewWriteAction;
import com.delphinium.action.review.ReviewWriteFormAction;
import com.delphinium.action.merchandise.MDDeleteAction;
import com.delphinium.action.merchandise.MDDetailAction;
import com.delphinium.action.merchandise.MDEditAction;
import com.delphinium.action.merchandise.MDEditFormAction;
import com.delphinium.action.merchandise.MDListAction;

public class DelphiniumActionFactory {
	private static DelphiniumActionFactory instance = new DelphiniumActionFactory();

	private DelphiniumActionFactory() {
	}

	public static DelphiniumActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;

		if (command.equals("main.do")) {
			action = new MainAction();
		}

		if (command.equals("loginForm.do")) {
			action = new LoginFormAction();
		}

		if (command.equals("login.do")) {
			action = new LoginAction();
		}

		if (command.equals("logout.do")) {
			action = new LogoutAction();
		}

		if (command.equals("conIDCheck.do")) {
			action = new ConIDCheckAction();
		}

		if (command.equals("marIDCheck.do")) {
			action = new MarIDCheckAction();
		}

		if (command.equals("mypageSelect.do")) {
			action = new MyPageSelectAction();
		}

		if (command.equals("memberEditForm.do")) {
			action = new MemberEditFormAction();
		}

		if (command.equals("conEdit.do")) {
			action = new ConEditAction();
		}

		if (command.equals("marEdit.do")) {
			action = new MarEditAction();
		}

		if (command.equals("memberDelete.do")) {
			action = new MemberDeleteAction();
		}

		if (command.equals("memberList.do")) {
			action = new MemberListAction();
		}

		if (command.equals("memberView.do")) {
			action = new MemberViewAction();
		}

		if (command.equals("market.do")) {
			action = new MarketViewAction();
		}

		if (command.equals("memberSearch.do")) {
			action = new MemberSearchAction();
		}

		if (command.equals("noticeList.do")) {
			action = new NoticeListAction();
		}

		if (command.equals("noticeView.do")) {
			action = new NoticeViewAction();
		}

		if (command.equals("noticeWriteForm.do")) {
			action = new NoticeWriteFormAction();
		}

		if (command.equals("noticeWrite.do")) {
			action = new NoticeWriteAction();
		}

		if (command.equals("noticeEditForm.do")) {
			action = new NoticeEditFormAction();
		}

		if (command.equals("noticeEdit.do")) {
			action = new NoticeEditAction();
		}

		if (command.equals("noticeDelete.do")) {
			action = new NoticeDeleteAction();
		}

		if (command.equals("promotionList.do")) {
			action = new PromotionListAction();
		}

		if (command.equals("promotionView.do")) {
			action = new PromotionViewAction();
		}

		if (command.equals("promotionWriteForm.do")) {
			action = new PromotionWriteFormAction();
		}

		if (command.equals("promotionWrite.do")) {
			action = new PromotionWriteAction();
		}

		if (command.equals("promotionEditForm.do")) {
			action = new PromotionEditFormAction();
		}

		if (command.equals("promotionEdit.do")) {
			action = new PromotionEditAction();
		}

		if (command.equals("promotionDelete.do")) {
			action = new PromotionDeleteAction();
		}

		if (command.equals("MDSelect.do")) {
			action = new MDSelectAction();
		}

		if (command.equals("MDRegiForm.do")) {
			action = new MDRegiFormAction();
		}

		if (command.equals("MDRegi.do")) {
			action = new MDRegiAction();
		}

		if (command.equals("MDEditForm.do")) {
			action = new MDEditFormAction();
		}

		if (command.equals("MDEdit.do")) {
			action = new MDEditAction();
		}

		if (command.equals("MDDelete.do")) {
			action = new MDDeleteAction();
		}

		if (command.equals("marMDList.do")) {
			action = new MarMDListAction();
		}

		if (command.equals("merchandiseList.do")) {
			action = new MDListAction();
		}

		if (command.equals("searchMDList.do")) {
			action = new MDSearchAction();
		}

		if (command.equals("marMDSearch.do")) {
			action = new MarMDSearchAction();
		}

		if (command.equals("detail.do")) {
			action = new MDDetailAction();
		}

		if (command.equals("cart.do")) {
			action = new CartAction();
		}

		if (command.equals("order.do")) {
			action = new OrderAction();
		}

		if (command.equals("orderList.do")) {
			action = new OrderListAction();
		}

		if (command.equals("orderView.do")) {
			action = new OrderViewAction();
		}

		if (command.equals("orderSearch.do")) {
			action = new OrderSearchAction();
		}

		if (command.equals("addCart.do")) {
			action = new AddCartAction();
		}

		if (command.equals("deleteCart.do")) {
			action = new DeleteCartAction();
		}

		if (command.equals("joinSelect.do")) {
			action = new JoinSelectAction();
		}

		if (command.equals("conJoinForm.do")) {
			action = new ConJoinFormAction();
		}

		if (command.equals("conJoin.do")) {
			action = new ConJoinAction();
		}

		if (command.equals("marJoin.do")) {
			action = new MarJoinAction();
		}

		if (command.equals("marJoinForm.do")) {
			action = new MarJoinFormAction();
		}

		if (command.equals("marMDRegi.do")) {
			action = new MDRegiAction();
		}

		if (command.equals("reviewWrite.do")) {
			action = new ReviewWriteAction();
		}

		if (command.equals("reviewWriteForm.do")) {
			action = new ReviewWriteFormAction();
		}

		if (command.equals("reviewList.do")) {
			action = new ReviewListAction();
		}

		if (command.equals("ownReview.do")) {
			action = new OwnReviewAction();
		}

		if (command.equals("reviewEditForm.do")) {
			action = new ReviewEditFormAction();
		}

		if (command.equals("reviewEdit.do")) {
			action = new ReviewEditAction();
		}

		if (command.equals("reviewDelete.do")) {
			action = new ReviewDeleteAction();
		}

		if (command.equals("ownQnAView.do")) {
			action = new OwnQnAViewAction();
		}

		if (command.equals("QnAWrite.do")) {
			action = new QnAWriteAction();
		}

		if (command.equals("qnaWriteForm.do")) {
			action = new QnAWriteFormAction();
		}

		if (command.equals("qnaEditForm.do")) {
			action = new QnAEditFormAction();
		}

		if (command.equals("qnaEdit.do")) {
			action = new QnAEditAction();
		}

		if (command.equals("qnaDelete.do")) {
			action = new QnADeleteAction();
		}

		if (command.equals("qnaList.do")) {
			action = new QnAListAction();
		}

		if (command.equals("marQnAWrite.do")) {

		}

		if (command.equals("marQnAEdit.do")) {

		}

		return action;
	}
}
