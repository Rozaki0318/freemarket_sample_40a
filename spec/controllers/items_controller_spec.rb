require 'rails_helper'

describe ItemsController do

  describe '#index' do
    let(:items) { create_list(:item,8) }

    context 'ログインしているとき' do
      before do
        user = create(:user)
        login user
        get :index
      end

      it 'indexのテンプレートが表示される' do
        expect(response).to render_template :index
      end

      it '@itemsが8個まで降順で生成される' do
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
      end

    end

    context 'ログインしていないとき' do
      before do
        get :index
      end

      it 'indexのテンプレートが表示される' do
        expect(response).to render_template :index
      end

      it '@itemsが8個まで降順で生成される' do
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
      end
    end
  end

  describe '#new' do

    context 'ログインしているとき' do
      before do
        user = create(:user)
        login user
        get :new
      end

      it 'newのテンプレートが表示される' do
        expect(response).to render_template :new
      end

      it '@itemが生成される' do
        expect(assigns(:item)).to be_a_new(Item)
      end

    end

    context 'ログインしていないとき' do
      before do
        get :new
      end

      it 'rootにredirectされる' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '#create' do

    let(:params){
                  {
                    item: {
                      name: "123456",
                      description: "12345",
                      category_id: 115,
                      brand_id: 16,
                      size_id: 10,
                      condition: "lv1",
                      shipping_fee: "f2",
                      shipping_way: "w1",
                      shipping_from: "iwt",
                      shipping_date: "d1",
                      price: 1200,
                      images_attributes: (:image)
                    }
                  }
                }

    context 'ログインしているとき' do
      before do
        user = create(:user)
        login user
      end

      context '保存できた場合' do

        subject {
          post :create,
          params: params
        }

        it '出品商品の数が増える' do
          expect{ subject }.to change(Item, :count).by(1)
        end

        it '出品に成功したらrootにredirectされる' do
          subject
          expect(response).to redirect_to(items_path)
        end
      end

      context '保存できなかった場合' do
        let(:invalid_params){
                      {
                        item: {
                          name: "123456",
                          description: "12345",
                          category_id: 115,
                          brand_id: 16,
                          size_id: 10,
                          condition: "lv1",
                          shipping_fee: "f2",
                          shipping_way: "w1",
                          shipping_from: "iwt",
                          shipping_date: "d1",
                          price: nil,
                          images_attributes: (:image)
                        }
                      }
                    }

        subject {
          post :create,
          params: invalid_params
        }

        it '出品商品の数は増えない' do
          expect{ subject }.not_to change(Item, :count)
        end

        # it 'indexにredirect' do
        #   subject
        #   expect(response).to render_template :index
        # end
      end

    end

    context 'ログインしていないとき' do

      it 'rootにredirectされる' do
        post :create, params: params
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '#show' do
    let(:user) { create(:user) }
    let(:item) { create(:item) }

    context 'ログインしているとき' do
      before do
        login user
        get :show, params: { id: item.id }, session: {}
      end

      it 'showのテンプレートが表示される' do
        expect(response).to render_template :show
      end

      it '@itemが1個生成される' do
        expect(assigns(:item)).to eq item
      end

    end

    context 'ログインしていないとき' do
      before do
        get :show, params: { id: item.id }, session: {}
      end


      it 'showのテンプレートが表示される' do
        expect(response).to render_template :show
      end

      it '@itemが1個生成される' do
        expect(assigns(:item)).to eq item
      end
    end
  end

  describe '#edit' do
    let(:item) { create(:item) }

    context 'ログインしているとき' do
      before do
        user = create(:user)
        login user
        get :edit, params: { id: item.id }, session: {}
      end

      it 'editのテンプレートが表示される' do
        expect(response).to render_template :edit
      end

      it '@itemが1個生成される' do
        expect(assigns(:item)).to eq item
      end

    end

    context 'ログインしていないとき' do
      before do
        get :edit, params: { id: item.id }, session: {}
      end

      it 'rootにredirectされる' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '#update' do
    let!(:item) { create(:item) }
    let(:update_attributes) do
      {
        name: "更新中",
        description: "更新中ですよー",
        category_id: 810,
        brand_id: 458,
        size_id: 0,
        condition: "lv1",
        shipping_fee: "f2",
        shipping_way: "w1",
        shipping_from: "iwt",
        shipping_date: "d1",
        price: 3000
      }
    end

    context 'ログインしているとき' do
      before do
        user = create(:user)
        login user
      end

      it '一つの商品情報がupdateされる' do
        expect do
          patch :update, params: { id: item.id, item: update_attributes }, session: {}
        end.to change(Item, :count).by(0)
      end

      it '商品情報のupdate内容が一致する' do
        patch :update, params: { id: item.id, item: update_attributes }, session: {}
        item.reload
        expect(item.name).to eq update_attributes[:name]
        expect(item.description).to eq update_attributes[:description]
        expect(item.category_id).to eq update_attributes[:category_id]
        expect(item.brand_id).to eq update_attributes[:brand_id]
        expect(item.size_id).to eq update_attributes[:size_id]
        expect(item.condition).to eq update_attributes[:condition]
        expect(item.shipping_fee).to eq update_attributes[:shipping_fee]
        expect(item.shipping_way).to eq update_attributes[:shipping_way]
        expect(item.shipping_from).to eq update_attributes[:shipping_from]
        expect(item.shipping_date).to eq update_attributes[:shipping_date]
        expect(item.price).to eq update_attributes[:price]
      end

      it '商品情報編集に成功したらrootにredirectされる' do
        patch :update, params: { id: item.id, item: update_attributes }, session: {}
        expect(response).to redirect_to(items_path)
      end

      it '商品情報編集に失敗したらeditテンプレートにredirectされる' do
        patch :update, params: { id: item.id, item: {price: nil} }, session: {}
        expect(response).to redirect_to(edit_item_path(item.id))
      end

    end

    context 'ログインしていないとき' do
      before do
        get :edit, params: { id: item.id }, session: {}
      end

      it 'rootにredirectされる' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '#destroy' do
    let!(:item) { create(:item) }

    context 'ログインしているとき' do

      before do
        user = create(:user)
        login user
      end

      it '出品したものを削除' do
        expect do
          delete :destroy, params: { id: item.id }, session: {}
        end.to change(Item, :count).by(-1)
      end

      it '商品情報削除に成功したらrootにredirectされる' do
        delete :destroy, params: { id: item.id }, session: {}
        expect(response).to redirect_to(items_path)
      end

    end

  end
end
