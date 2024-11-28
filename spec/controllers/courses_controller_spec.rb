require 'rails_helper'

require 'ffaker'
require 'byebug'

RSpec.describe CoursesController, :type => :controller do
  describe "GET #index" do
    context 'Para 0 cursos existentes' do
      before :each do
        get :index
        @parsed_response_body = JSON.parse(response.body)
      end

      it 'Retorna metadados corretos' do
        meta_expected = { "total_count"=> 0, "total_pages"=> 0, "current_page"=> 1, "next_page"=> nil, "prev_page"=> nil }
        expect(@parsed_response_body['meta']).to eq(meta_expected)
      end

      it 'Retorna uma lista vazia' do
        expect(@parsed_response_body['courses']).to eq([])
      end

      it 'Retorna status de sucesso (200)' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'Para 1 curso existente' do
      before :each do
        Course.create(name: FFaker::Education.degree, description: FFaker::Lorem.paragraph)
        get :index
        @parsed_response_body = JSON.parse(response.body)
      end
  
      it 'Retorna metadados corretos' do
        meta_expected = { "total_count"=> 1, "total_pages"=> 1, "current_page"=> 1, "next_page"=> nil, "prev_page"=> nil }
        expect(@parsed_response_body['meta']).to eq(meta_expected)
      end
  
      it 'Retorna uma lista com a quantidade correta' do
        expect(@parsed_response_body['courses'].length).to eq(1)
      end
  
      it 'Retorna status de sucesso (200)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #show" do
    context "Para um ID inexistente" do
      before :each do
        get :show, params: { id: 0 }
        @parsed_response_body = JSON.parse(response.body)
      end

      it "Retorna mensagem de erro correspondente" do
        expect(@parsed_response_body).to eq({
          "code" => "course_not_found_for_id",
          "message" => "No course found for the id 0"
        })
      end

      it "Retorna status de recurso não encontrado (404)" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "Para um ID de curso válido" do
      before :each do
        @course = Course.create(name: FFaker::Education.degree, description: FFaker::Lorem.paragraph)
        get :show, params: { id: @course.id }
        @parsed_response_body = JSON.parse(response.body)
      end

      it "Retorna os dados do curso correspondente" do
        expect(@parsed_response_body).to eq({
          "id" => @course.id,
          "name" => @course.name,
          "description" => @course.description,
          "created_at" => @course.created_at.as_json,
          "updated_at" => @course.updated_at.as_json
        })
      end

      it "Retorna status de sucesso (200)" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    context 'Com parâmetros válidos' do
      before do
        @data = { name: FFaker::Education.degree, description: FFaker::Lorem.paragraph }
        post :create, params: {course: @data }
        @parsed_response_body = JSON.parse(response.body)
      end

      it 'Cria o curso com os valores correspondentes' do
        @data.keys.each do |key|
          expect(@parsed_response_body["#{key}"]).to eq(@data[key])
        end
      end

      it 'Retorna status de recurso criado (201)' do
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "PATCH #update" do
    context "Para um ID inexistente" do
      before :each do
        patch :update, params: { id: 0 }
        @parsed_response_body = JSON.parse(response.body)
      end

      it "Retorna mensagem de erro correspondente" do
        expect(@parsed_response_body).to eq({
          "code" => "course_not_found_for_id",
          "message" => "No course found for the id 0"
        })
      end

      it "Retorna status de recurso não encontrado (404)" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "Para um ID válido" do
      before :each do
        course = Course.create(name: "Vai mudar", description: "Qualquer coisa")
        @data = { name: "Tecnólogo em Análise e Desenvolvimento de Sistemas", description: "O perfil do profissional formado é o de um empreendedor, com capacidade de trabalho em equipes, dotado de iniciativa na proposta e implementação da solução de problemas e de espírito de cooperação e articulação." }
        patch :update, params: { id: course.id, course: @data }
        @parsed_response_body = JSON.parse(response.body)
      end

      it "Atualiza o curso com os valores correspondentes" do
        @data.keys.each do |key|
          expect(@parsed_response_body["#{key}"]).to eq(@data[key])
        end
      end

      it "Retorna status de sucesso (200)" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE #destroy" do
    context "Para um ID inexistente" do
      before :each do
        delete :destroy, params: { id: 0 }
        @parsed_response_body = JSON.parse(response.body)
      end

      it "Retorna mensagem de erro correspondente" do
        expect(@parsed_response_body).to eq({
          "code" => "course_not_found_for_id",
          "message" => "No course found for the id 0"
        })
      end

      it "Retorna status de recurso não encontrado (404)" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "Para um ID válido" do
      before :each do
        @course = Course.create(name: FFaker::Education.degree, description: FFaker::Lorem.paragraph)
        delete :destroy, params: { id: @course.id }
      end

      it "Deleta o registro o curso" do
        expect { @course.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it "Retorna status de sem conteúdo (204)" do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
