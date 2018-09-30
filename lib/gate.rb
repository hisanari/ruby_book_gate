# 改札機を表すクラス
class Gate
  STATIONS = [:umeda, :juso, :mikuni].freeze
  FARES = [150, 190].freeze

  # Gateオブジェクトの作成
  # ==== 引数
  # * +name+ - 駅名
  def initialize(name)
    @name = name
  end

  # 入場した駅を記録する
  # ==== 引数
  # * +ticket+ - 切符
  def gate_enter(ticket)
    ticket.stamp(@name)
  end

  # 退場する
  # ==== 引数
  # * +ticket+ - 切符
  # ==== 戻り値
  # * +boolean+ - 運賃が足りていなければ+true,不足していれば+false
  def gate_exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  # 入場した駅から退場した駅から運賃を計算する
  # ==== 引数
  # * +ticket+ - 切符
  # ==== 戻り値
  # * +integer+ - 必要な運賃
  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end

end