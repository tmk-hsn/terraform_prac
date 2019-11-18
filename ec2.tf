resource "aws_instance" "web1" {
    ami = "${data.aws_ami.amazon_linux.id}"
    instance_type = "m5.large" 
    monitoring    = true
    tags = {
        Name = "test_hosono_1"
    }
}
