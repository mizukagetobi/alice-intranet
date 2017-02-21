class TipoServicio < ApplicationRecord
	belongs_to :tipo_atencion

	has_many :adiccion_tipo_servicios
  has_many :adiccions, :through => :adiccion_tipo_servicios
  has_many :cirugia_tipo_servicios
  has_many :cirugias, through: :cirugia_tipo_servicios

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  	after_save :save_adicciones, :save_cirugias

    attr_reader :adicciones, :cirugiasTipoServicio 

  	def adicciones=(value)
	  	@adicciones = value
	  end

    def cirugiasTipoServicio=(value)
      @cirugiasTipoServicio = value
    end

   private
   def save_adicciones
    AdiccionTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@adicciones.nil?
	      @adicciones.each do |adiccion_id|
		      AdiccionTipoServicio.create(adiccion_id: adiccion_id, tipo_servicio_id: self.id )
        end
	   end
   end

   private
   def save_cirugias
    CirugiaTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@cirugiasTipoServicio.nil?
        @cirugiasTipoServicio.each do |cirugia_id|
          CirugiaTipoServicio.create(cirugia_id: cirugia_id, tipo_servicio_id: self.id )
        end
     end
   end
end